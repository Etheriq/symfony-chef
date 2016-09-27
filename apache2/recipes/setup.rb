package "Install Apache" do
   case node[:platform]
      when "redhat", "amazon"
         package_name "httpd" do
            action :install
         end
      when "ubuntu"
         package_name "apache2" do
            action :install
         end
   end
end
