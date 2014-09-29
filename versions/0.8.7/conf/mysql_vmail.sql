/* Create database for virtual hosts. */
CREATE DATABASE IF NOT EXISTS vmail CHARACTER SET utf8;

/* Permissions. */
GRANT SELECT ON vmail.* TO "vmail"@"localhost" IDENTIFIED BY "H8rcg9QrlnsbXLd5HyDm2UgDwhKzel";
GRANT SELECT,INSERT,DELETE,UPDATE ON vmail.* TO "vmailadmin"@"localhost" IDENTIFIED BY "IOaUUSBXg43Dk8GMTWnO0J2jVXJOkh";

/* Initialize the database. */
USE vmail;
SOURCE /opt/repo/samples/iredmail.mysql;

/* Add your first domain. */
INSERT INTO domain (domain,transport,created) VALUES ("example.com", "dovecot", NOW());

/* Add your first normal user. */
INSERT INTO mailbox (username,password,name,maildir,quota,domain,isadmin,isglobaladmin,created) VALUES ("postmaster@example.com","$1$Rvv0jcpZ$4kHlqs9.4.P/ta2aThq0o0","postmaster","example.com/p/o/s/postmaster-2014.09.26.16.29.40/",100, "example.com", 1, 1, NOW());
INSERT INTO alias (address,goto,domain,created) VALUES ("postmaster@example.com", "postmaster@example.com", "example.com", NOW());

/* Mark first mail user as global admin */
INSERT INTO domain_admins (username,domain,created) VALUES ("postmaster@example.com","ALL", NOW());

