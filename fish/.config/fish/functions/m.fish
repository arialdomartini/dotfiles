function m --wraps mkdir --description 'mkdir -p + cd'
    mkdir -p $argv; and cd $argv[1]
end
