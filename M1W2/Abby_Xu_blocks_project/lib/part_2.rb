def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    suffixes = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        suffixes.any? { |suffix| url.end_with?(suffix) }
    end
end

def any_passing_students?(students)
    students.any? do |student|
        grades = student[:grades]
        avg = grades.sum * 1.0 / grades.size
        avg >= 75
    end
end
