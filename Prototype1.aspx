<html>
    <head><title>Local7001</title>
    </head>
    <body style="height: 210px">

        <!-- -->
        <button id="postchanger" onclick="changePost()" style="display: none; position: fixed; top: 23px; left: 636px;">Click me!</button>

        <!-- Category A -->
        <div id="Category A" class="Category">
            <div id="Name of Piece" class="tumblr-post"  data-href="https://embed.tumblr.com/embed/post/br1QNm4IBfuJflwB3lAwtw/162629113109"></div>
        </div>
        <!-- Category B -->
        <div id="Category B" class="Category">
            <div id="Name" class="tumblr-post"  data-href="https://embed.tumblr.com/embed/post/DBZuDnoBjw1YJIpwgA-KnQ/162630137681"></div>
        </div>

        <!-- Category C -->
        <div id="Category C" class="Category">
            <div id="gif one" class="tumblr-post"  data-href="https://embed.tumblr.com/embed/post/xUywV14VNnL8TJGGQuk9Bg/162645079850"></div>
            <div id="gif two" class="tumblr-post"  data-href="https://embed.tumblr.com/embed/post/xUywV14VNnL8TJGGQuk9Bg/162645079850"></div>
        </div>

        <!-- Textboxes -->
        <div style="position: fixed; right: 1px; top: 8px; width: 858px; height: 650px;">
            <div style="position: fixed; top: 63px; left: 639px; width: 122px; height: 296px;">
                <input id="Text1" class="Category_txt_intro" style="font-weight: bold; text-decoration: underline overline; color: black;" 
                    type="text" readonly="readonly" value="|Select A Category|"/>
                <input id="Category A_txt" class="Category_txt" type="text" readonly="readonly" onclick='selectCategory(id);' onmouseover="colorHovered(id)" 
                    onmouseout="handle_onmouseout(id)"  value="Category A"/>                                                                      
                <input id="Category B_txt" class="Category_txt" type="text" readonly="readonly" onclick='selectCategory(id);' onmouseover="colorHovered(id)" 
                    onmouseout="handle_onmouseout(id)" value="Category B"/>                                                                       
                <input id="Category C_txt" class="Category_txt" type="text" readonly="readonly" onclick='selectCategory(id);' onmouseover="colorHovered(id)" 
                    onmouseout="handle_onmouseout(id)" value="Category C"/>
            </div>
        </div>

        <style>
            .Category_txt, .Category_txt_intro{
                border-style: none;
                border-color: inherit;
                border-width: 0;
                background-color: transparent;
                padding-bottom: 5px;
                color: #C0C0C0;
                height: 33px;
                width: 184px;
                font-size: larger;
            }
        </style>

        <script async src="https://assets.tumblr.com/post.js"></script>
        <script>
            var selectedCategory = null;
           // colorSelected(get_txt(selectedCategory).id);
           // activateCategory(selectedCategory);
            
            function get_txt(category) {
                return document.getElementById(category.id + "_txt");
            }
            function get_category(category_txt) {
                return document.getElementById(category_txt.id.substring(0,category_txt.id.length-4));
            }
            function handle_onmouseout(id_txt) {
                textbox = document.getElementById(id_txt)
                if (selectedCategory != null && get_txt(selectedCategory).id === id_txt)
                    colorSelected(id_txt);
                else
                    colorIdle(id_txt);
            }
            function colorIdle(id_txt) {
                textbox = document.getElementById(id_txt);
                textbox.style.color = "#C0C0C0";
                textbox.style.backgroundColor = "transparent";
                textbox.style.fontWeight = "normal";
            }
            function colorHovered(id_txt) {
                textbox = document.getElementById(id_txt)
                textbox.style.color = "#E8E8E8";
                textbox.style.backgroundColor = "#C0C0C0";
                textbox.style.fontWeight = "bold";

            }
            function colorSelected(id_txt) {
                textbox = document.getElementById(id_txt)
                textbox.style.color = "red";
                textbox.style.backgroundColor = "#ADD8E6";
                textbox.style.fontWeight = "bold";
            }
            function activateCategory(category) {
                categories = document.getElementsByClassName("Category");
                for (var i = 0; i < categories.length; i++) {
                    if (categories[i] === category) {
                        for (var j = 1; j < categories[i].childNodes.length; j+=2) {
                            var iframe = categories[i].childNodes.item(j);
                            iframe.style.display = "block";
                        }
                    } else {
                        for (var j = 1; j < categories[i].childNodes.length; j+=2) {
                            var iframe = categories[i].childNodes.item(j)
                            iframe.style.display = "none";
                        }
                    }
                }
            }
            function activateAllCategories() {
                categories = document.getElementsByClassName("Category");
                for (var i = 0; i < categories.length; i++) {
                    for (var j = 1; j < categories[i].childNodes.length; j += 2) {
                        var iframe = categories[i].childNodes.item(j);
                        iframe.style.display = "block";
                    }
                }
            }
            function selectCategory(id_txt) {
                // Disable previous selection, if present
                if (selectedCategory != null)
                    colorIdle(get_txt(selectedCategory).id);
                // unselect
                if (selectedCategory != null && get_txt(selectedCategory).id === id_txt) {
                    // unselect
                    selectedCategory = null;
                    // Show all categories!
                    activateAllCategories();
                }else{
                    // Make new selection and light it up!
                    selectedCategory = get_category(document.getElementById(id_txt));
                    colorSelected(id_txt);
                    // Showing posts from said category
                    activateCategory(selectedCategory);
                }
            }
        </script>
    </body>
</html>