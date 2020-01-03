class Search{
    constructor(root){
        var self = this;
        self.filter = root.querySelector("input.filter");
        self.list = root.querySelector(".libraries");
        self.relevant = [ ".name", ".description" ];

        self.filter.addEventListener("input", function(){
            self.filterResults(self.filter.value);
        });
    }

    isCandidate(text, tokens){
        var lower = text.toLowerCase();
        for(var i=0; i<tokens.length; ++i){
            if(lower.indexOf(tokens[i]) != -1)
                return true;
        };
        return false;
    }

    forEachResult(func){
        for(var i=0; i<this.list.children.length; ++i){
            func(this.list.children[i], i);
        }
    }

    filterResults(filter){
        var self = this;
        if(filter == ""){
            self.forEachResult(function(child){
                child.style.display = "block";
            });
            return;
        }
            
        var tokens = filter.split(/[,. ]+/);
        self.forEachResult(function(child){
            var text = "";
            self.relevant.forEach(function(item){
                text += child.querySelector(item).innerText;
            });
            child.style.display = (self.isCandidate(text, tokens))? "block" : "none";
        });
    }
}

window.addEventListener("DOMContentLoaded", function(){
    search = new Search(document.querySelector("main"));
});
