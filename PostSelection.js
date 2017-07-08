var selectedCategory = null;
            
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