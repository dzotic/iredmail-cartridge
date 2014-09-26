/* Create database for virtual hosts. */
CREATE DATABASE IF NOT EXISTS vmail CHARACTER SET utf8;

/* Permissions. */
GRANT SELECT ON vmail.* TO "vmail"@"localhost" IDENTIFIED BY "OeRroX165V0pWElJlNl6PPvK2jbgZU";
GRANT SELECT,INSERT,DELETE,UPDATE ON vmail.* TO "vmailadmin"@"localhost" IDENTIFIED BY "abtQOhMX0WNuuw9QtqtJUuI7nVVnXi";

/* Initialize the database. */
USE vmail;
SOURCE /opt/repo/versions/0.8.7/samples/iredmail.mysql;

/* Add your first domain. */
INSERT INTO domain (domain,transport,created) VALUES ("iredmail.dev.jelastic.com", "dovecot", NOW());

/* Add your first normal user. */
INSERT INTO mailbox (username,password,name,maildir,quota,domain,isadmin,isglobaladmin,created) VALUES ("postmaster@iredmail.example.com","$1$osgTHTDY$coMiQrobEFSCmdlu0V2Om1","postmaster","iredmail.example.com/p/o/s/postmaster-2014.09.19.13.15.37/",100, "iredmail.example.com", 1, 1, NOW());
INSERT INTO alias (address,goto,domain,created) VALUES ("postmaster@iredmail.example.com", "postmaster@iredmail.example.com", "iredmail.example.com", NOW());

/* Mark first mail user as global admin */
INSERT INTO domain_admins (username,domain,created) VALUES ("postmaster@iredmail.example.com","ALL", NOW());

