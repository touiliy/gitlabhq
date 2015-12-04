class AddCiToProject < ActiveRecord::Migration
  def up
    add_column :projects, :builds_enabled, :boolean, default: true, null: false
    add_column :projects, :shared_runners_enabled, :boolean, default: true, null: false
    add_column :projects, :token, :string
    add_column :projects, :build_coverage_regex, :string
    add_column :projects, :build_allow_git_fetch, :boolean, default: true, null: false
    add_column :projects, :build_timeout, :integer, default: 3600, null: false
  end
end
