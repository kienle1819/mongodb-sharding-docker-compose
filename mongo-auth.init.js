admin = db.getSiblingDB("admin")
admin.createUser(
  {
    user: "admin",
    pwd: "admin@123",
    roles: [ { role: "root", db: "admin" } ]
  }
)
