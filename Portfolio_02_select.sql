select * from Gremien;

select * from Sitzungen where in ('nimmt_teil').Name.Vorname contains 'Hanna' or in ('nimmt_teil').Name.Vorname contains 'Elizabeth';

Traverse out ('nimmt_teil') from (select * from Personen where Name.Nachname is not null);