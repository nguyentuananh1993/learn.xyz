json.array!(@learning_logs) do |learning_log|
  json.extract! learning_log, :id, :learned_word, :user_id
  json.url learning_log_url(learning_log, format: :json)
end
