CREATE OR REPLACE FUNCTION gds.pl_insert_salle(
	une_date_debut timestamp without time zone,
	une_date_fin timestamp without time zone,
	un_nom_de_salle character varying(250)
	
) RETURNS gds.reservation AS $$

	DECLARE
		nouvelle_salle gds.salle%ROWTYPE;
	BEGIN
		INSERT INTO gds.salle(id, nom, nb_personnes_max, date_creation, date_modification)
			VALUES (nextval('gds.val_seq'), un_nom, un_nb_personnes_max, now(), now())
			RETURNING * INTO nouvelle_salle;
		RETURN nouvelle_salle;
	END;
$$ LANGUAGE plpgsql;
