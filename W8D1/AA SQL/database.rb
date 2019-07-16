require "sqlite3" # gem
require "singleton" # only have one instance of our database



class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super("questions.db")
        self.type_translation = true
        self.results_as_hash = true
    end
end
