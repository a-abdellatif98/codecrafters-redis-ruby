require 'socket'

class YourRedisServer
  def initialize(port)
    @port = port
  end

  def start
    # You can use print statements as follows for debugging, they'll be visible when running tests.
    puts('Logs from your program will appear here!')

    # Uncomment this block to pass the first stage
    server = TCPServer.new(@port)
    client = server.accept
    until client.eof?
      x = client.readpartial 1024
      client.write "+PONG\r\n"
    end
    client.close
  end
end

YourRedisServer.new(6379).start
