module Log
    def self.log(msg); puts("==> #{msg}") end
    def self.error(msg); puts("==> [ERROR] #{msg}") end
    def self.info(msg); puts("==> [INFO] #{msg}") end
    def self.debug(msg); puts("==> [DEBUG] #{msg}") end
    def self.trace(msg); puts("==> [TRACE] #{msg}") end
end