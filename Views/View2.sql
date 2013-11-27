--Views

--2. All empty lot

--set the format!!
--Assume that if a lot is empty then there is no house_id assigned to the lot.
CREATE OR REPLACEVIEW view_enptylot AS
	SELECT l.lot_id, l.latitude, l.longtitude, l.subdivision_id, s.name
	FROM Lot l
	LEFT JOIN Subdivition s on l.subdivision_id = s.subdivision_id
	WHERE house_id = NULL;
