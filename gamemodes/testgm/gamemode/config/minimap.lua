-- Мини-карта (cl_minimap.lua): снимок карты сверху и его границы в координатах мира.
-- Снимок делает автотест: tools/selftest/run_selftest.ps1 -Suite mapshot, потом
-- stitch_mapshot.ps1 — он кладёт картинку в materials/ и печатает строку для этой таблицы.
-- Для карты без строки мини-карта не рисуется.
PR_MINIMAPS = {
	rp_desert_conflict = {material = "test_gm_mat/minimap/rp_desert_conflict.jpg", minX = -15360, maxX = 15360, minY = -15360, maxY = 15360},
}
