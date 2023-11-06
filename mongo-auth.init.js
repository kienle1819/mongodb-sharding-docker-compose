admin = db.getSiblingDB("admin") 
admin.createUser(
  {
    user: 'root',
    pwd: 'admin@123',
    roles: [ { role: 'root', db: 'admin' } ]
  }
);
exit;