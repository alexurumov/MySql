DELIMITER $$

CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE isCompromised INT;
  DECLARE regexString VARCHAR(50);
  SET regexString = CONCAT('^[', set_of_letters, ']+$');
  SET isCompromised = (SELECT word REGEXP regexString);
  RETURN isCompromised;
END $$