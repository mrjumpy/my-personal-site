{"filter":false,"title":"application.rb","tooltip":"/config/application.rb","undoManager":{"mark":-1,"position":-1,"stack":[[{"group":"doc","deltas":[{"start":{"row":11,"column":4},"end":{"row":16,"column":7},"action":"insert","lines":[" config.middleware.insert_before 0, \"Rack::Cors\" do","      allow do","        origins '*'","        resource '*', :headers => :any, :methods => [:get, :post, :options]","      end","    end"]}]}]]},"ace":{"folds":[],"scrolltop":60,"scrollleft":0,"selection":{"start":{"row":11,"column":4},"end":{"row":11,"column":4},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":2,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1427708881341,"hash":"630fc8ab53144bbfef84803053fbef1fc0398d20"}