script "kill_all_containers" do  
  interpreter "ruby"
  user "root"
  code <<-EOH
    `sudo docker ps -q`.split("\n").each do |container_id|
      `sudo docker stop \#{container_id}`
    end
    `sudo docker ps -a -q`.split("\n").each do |container_id|
      `sudo docker rm \#{container_id}`
    end
  EOH
end