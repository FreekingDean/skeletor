# == Schema Information
#
# Table name: settings
#
#  id               :integer          not null, primary key
#  settingable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  value            :string
#  type             :string
#  metadata         :jsonb            not null
#  settingable_type :string
#

class DatabaseSetting < Setting
  UNCOMMON_DATABASES = %w(frontbase ibm_db)
  COMMON_DATABASES = %w(mysql oracle postgresql sqlite3 sqlserver)
  JRUBY_DATABASES = %w(jdbc jdbcmysql jdbcpostgresql jdbcsqlite3)
  VALID_DATABASES = UNCOMMON_DATABASES + COMMON_DATABASES + JRUBY_DATABASES
  DEFAULT_DATABASE = 'postgresql'
end
