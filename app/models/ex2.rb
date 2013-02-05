    

def guess_one(x) 
     x > 10
end

def guess_two(x)
    x <= 50
end

def guess_three(x)
    guess_one(x) && guess_two(x)
end

def guess_four(x)
    if x == "knock knock"
     "Who's there?"
    else
        "huh?"
    end
end
