def run_sql(sql, params = [])
  conn = PG.connect(ENV['DATABASE_URL'] || { dbname: "buzz_feed" })
  conn.prepare(sql, sql)
  records = conn.exec_prepared(sql, params)
  conn.close
  return records
end

def all_buzzwords()
  return run_sql("SELECT * FROM buzzwords;")
end

def find_one_buzzword(id)
  return run_sql("SELECT * FROM buzzwords where id = $1;", [id]).first
end

def all_buzzwords_by_user_id(id)
  return run_sql("SELECT * FROM buzzwords where user_id = $1;", [id])
end

def create_buzzword(word, description)
  return run_sql("INSERT INTO buzzwords (word, description) VALUES ($1, $2) returning id;", [word, description]);
end