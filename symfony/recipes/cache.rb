node[:deploy].each do |app_name, deploy|
  execute "cache" do
      group deploy[:group]
      if platform?("ubuntu")
          user "www-data"
      elsif platform?("amazon")
          user "apache"
      end

      cwd "#{deploy[:deploy_to]}/current"
      command "#{deploy[:deploy_to]}/current/app/console cache:clear --env=prod"
  end
end