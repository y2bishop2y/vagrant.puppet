#
# nodes.pp defines all puppet nodes
#

# Self manage the puppet master server

node 'puppet' { }

#### CLIENTS

node 'client1' {
  class { 'helloworld' }
}

node 'client2'  { }
