# 部署 `elasticsearch+fluentd+kibana`

## 多节点主机部署hosts文件示例：
### 说明：
	   1. 下载软件包efkpackage.tar.gz并上传到/root/package/目录
	         链接：https://pan.baidu.com/s/1wgUuDsHRtrWMQs6YQhucyA  提取码：yd9t
	         MD5：caab1f3677a176d652ff2419b8df142d
	   2. 执行init.sh脚本
	   3. 改hosts配置
	   4. 直接执行`# ansible-playbook -i hosts efk.yml`
```
############
[elasticsearch]
192.168.2.29 ansible_ssh_port=22 ansible_ssh_user=root ansible_ssh_pass="test@123" node_name=node-1 network_host=192.168.2.29
192.168.2.56 ansible_ssh_port=22 ansible_ssh_user=root ansible_ssh_pass="test@123" node_name=node-2 network_host=192.168.2.56
#network_host: Elasticsearch监听地址

[elasticsearch:vars]
# 定义Elasiticsearch discovery.zen.ping.unicast.hosts节点地址,多台写法：discovery_hosts='"192.168.2.29","192.168.2.56"'
discovery_hosts='"192.168.2.29","192.168.2.56"'


############
[fluentd]
192.168.2.29 ansible_ssh_port=22 ansible_ssh_user=root ansible_ssh_pass="test@123" network_host=192.168.2.29
192.168.2.56 ansible_ssh_port=22 ansible_ssh_user=root ansible_ssh_pass="test@123" network_host=192.168.2.56
# network_hosts表示要连接的elasticsearch服务器的地址


############
[kibana]
192.168.2.29 ansible_ssh_port=22 ansible_ssh_user=root ansible_ssh_pass="test@123"

[kibana:vars]
# 定义kibana监听地址
kibana_host="192.168.2.29"
# 定义kibana中连接elasticsearch服务的地址
elasticsearch_hosts="192.168.2.29"
```


