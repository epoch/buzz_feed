def current_user
  find_one_user(session[:user_id])
end

def logged_in?
  if current_user
    return true
  else
    return false
  end
end

def run_sql(sql, params = [])
  conn = PG.connect(ENV['DATABASE_URL'] || { dbname: "buzz_feed" })
  conn.prepare(sql, sql)
  records = conn.exec_prepared(sql, params)
  conn.close
  return records
end  

