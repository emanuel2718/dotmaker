function aoc-load

    set AOC_SESSION (gpg --decrypt ~/.aoc_session.txt.gpg)
    if set -q argv[1]
        curl --cookie "session=$AOC_SESSION" https://adventofcode.com/$argv[1]/day/$argv[2]/input > in.txt
    else
        set date_str (date +https://adventofcode.com/%Y/day/%d/input)
        set date_str (string replace -r '/0' '/' $date_str)
        curl --cookie "session=$AOC_SESSION" $date_str > in.txt
    end
end
