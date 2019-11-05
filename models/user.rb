require 'bcrypt'

def all_users()
  return run_sql("SELECT * FROM users;")
end

def find_one_user(id)
  return nil unless id # guard condition - early return
  return run_sql("SELECT * FROM users WHERE id = #{id};").first
end

def find_user_by_email(email)
  return run_sql("SELECT * FROM users WHERE email = '#{email}';").first
end

def create_user(email, password, bio)
  password_digest = BCrypt::Password.create(password)
  sql =  "INSERT INTO users (email, password_digest, bio) "
  sql += "VALUES ('#{ email }', '#{ password_digest }', '#{ bio }');"
  return run_sql(sql)
end



