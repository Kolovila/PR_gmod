import re, sys

BS = chr(92)


def strip(src):
    out = []
    i = 0
    n = len(src)
    while i < n:
        c = src[i]
        if src.startswith('--[', i):
            m = re.match(r'--\[(=*)\[', src[i:])
            if m:
                close = ']' + m.group(1) + ']'
                j = src.find(close, i)
                j = n if j < 0 else j + len(close)
                out.append('\n' * src.count('\n', i, j))
                i = j
                continue
        if src.startswith('--', i) or src.startswith('//', i):
            j = src.find('\n', i)
            i = n if j < 0 else j
            continue
        if src.startswith('/*', i):
            j = src.find('*/', i)
            j = n if j < 0 else j + 2
            out.append('\n' * src.count('\n', i, j))
            i = j
            continue
        m = re.match(r'\[(=*)\[', src[i:])
        if m:
            close = ']' + m.group(1) + ']'
            j = src.find(close, i)
            j = n if j < 0 else j + len(close)
            out.append(' S ' + '\n' * src.count('\n', i, j))
            i = j
            continue
        if c in '"\'':
            j = i + 1
            while j < n and src[j] != c and src[j] != '\n':
                if src[j] == BS:
                    j += 1
                j += 1
            out.append(' S ')
            i = j + 1
            continue
        out.append(c)
        i += 1
    return ''.join(out)


def check(path):
    src = open(path, encoding='utf-8-sig', errors='replace').read()
    code = strip(src)
    stack = []
    errs = []
    paren = {'(': 0, '{': 0, '[': 0}
    for ln, line in enumerate(code.split('\n'), 1):
        for tok in re.findall(r'[A-Za-z_][A-Za-z0-9_]*|[(){}\[\]]', line):
            if tok in ('function', 'if', 'repeat'):
                stack.append([tok, ln, False])
            elif tok in ('for', 'while'):
                stack.append([tok, ln, True])
            elif tok == 'do':
                if stack and stack[-1][2]:
                    stack[-1][2] = False
                else:
                    stack.append(['do', ln, False])
            elif tok == 'end':
                if not stack:
                    errs.append(f'{ln}: лишний end')
                    continue
                stack.pop()
            elif tok == 'until':
                if not stack or stack[-1][0] != 'repeat':
                    errs.append(f'{ln}: until без repeat')
                else:
                    stack.pop()
            elif tok in '({[':
                paren[tok] += 1
            elif tok in ')}]':
                o = {')': '(', '}': '{', ']': '['}[tok]
                paren[o] -= 1
                if paren[o] < 0:
                    errs.append(f'{ln}: лишняя {tok}')
                    paren[o] = 0
    for s in stack:
        errs.append(f'{s[1]}: незакрытый {s[0]}')
    for k, v in paren.items():
        if v:
            errs.append(f'незакрытые {k} x{v}')
    return errs


sys.stdout.reconfigure(encoding='utf-8')
bad = 0
for p in sys.argv[1:]:
    e = check(p)
    if e:
        bad += 1
        print('FAIL', p)
        for x in e[:8]:
            print('   ', x)
print(f'checked {len(sys.argv) - 1} files, {bad} with problems')
