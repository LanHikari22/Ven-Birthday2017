var postCount = 0;
var page = 0;
var pageAssociatedCategory = null;
var numPosts = 5;
function renderPosts() {
    document.write(['<script async src="https://assets.tumblr.com/post.js">', '<', '/script>'].join(''));
}

function handlePrev() {
    alert(selectedCategory);
}

function handleNext() {
    render_unmarkall();
}


function deactivateAllCategories() {
    categories = document.getElementsByClassName("Category");
    for (var i = 0; i < categories.length; i++) {
        for (var j = 1; j < categories[i].childNodes.length; j += 2) {
            var iframe = categories[i].childNodes.item(j);
            iframe.style.display = "none";
        }
    }
}

function render_unmarkall() {
    var categories = document.getElementsByClassName("Category");
    for(var i = 0; i<categories.length; i++){
        category = categories[i];
        for (var j = 1; j < category.childNodes.length; j+=2) {
            element = category.childNodes[j];
            if (element instanceof HTMLDivElement && element.className[element.className.length-1] !== 'X') {
                element.className += 'X';
            }
        }
    }
}

function render_mark(category, divIndex) {
    element = category.childNodes[divIndex];
    if (element instanceof HTMLDivElement && element.className[element.className.length - 1] === 'X') {
        element.className = element.className.substring(0, element.className.length - 1);
    }
}

function togglePost(category, ifrIndex, isVisible) {
    iframe = category.childNodes[ifrIndex]
    if (iframe instanceof HTMLIFrameElement) {
        if (iframe.style.display === "block")
            iframe.style.display = "none";
        else
            iframe.style.display = "block";
    }
}

function isRendered(category, index) {
    element = category.childNodes[divIndex];
    return element instanceof HTMLIFrameElement;
}

function render_n(startingPostIndex, numPosts, isVisible) {
    postCount = getPostCount(startingPostIndex); // This post has not been rendered. postCount number of posts have.
    posts[numPosts];
    for (var i = 0; i < numPosts; i++) {
        posts[i] = getNextPostIndex(postCount++); // [index, category]
        if (posts[i][0] == -1 && posts[i][1] == null) // end of line, we've got no more elements...
            break;
        render_mark(posts[i][1], posts[i][0]);
    }

    renderPosts();
    if (!isVisible) {
        for (var i = 0; i < numPosts; i++) {
            if (posts[i][0] == -1 && posts[i][1] == null) // end of line, we've got no more elements...
                break;
            alert("index=" + posts[i][0]);
            togglePost(posts[i][1],posts[i][0],false) // make posts invisible
        }
    }
}

function dispPage(numPosts, numPage){

}

function hidePage(numPosts, numPage){

}
// Returns an array [index, Category] to specify what category the post belongs to. Returns [-1, null] if no post is available.
function getNextPostIndex(postCount){
    assertCategoryState();
    invalidClock = 0; // this will tick until it equates numPosts. Once it does, the next post determines an unreached post. 
    index = -1;
    postCategory = null;
    if (selectedCategory == null) {
        categories = document.getElementsByClassName("Category");
        for (var i = 0; i < categories.length; i++) {
            category = categories[i];
            for (var j = 1; j < category.childNodes.length; j += 2) {
                if (invalidClock < postCount)
                    invalidClock++;
                else {
                    index = j;
                    postCategory = category;
                    break;
                }
            }
            // check if we obtained next post index
            if (index != -1 && postCategory != null)
                break;
        }
    } else {
        category = selectedCategory;
        for (var j = 1+2*postCount; j < category.childNodes.length; j += 2) {
            index = j;
            postCategory = category;
            break;
        }
    }
    return [index, postCategory];
}

function getNumRemainingPosts(postCount) {
    assertCategoryState();
    invalidClock = 0; // this will tick until it equates numPosts. Once it does, remaining will start ticking.
    remaining = 0;
    index = -1;
    if (selectedCategory === null) {
        categories = document.getElementsByClassName("Category");
        for (var i = 0; i < categories.length; i++) {
            category = categories[i];
            for (var j = 1; j < category.childNodes.length; j += 2) {
                if (invalidClock < postCount)
                    invalidClock++;
                else 
                    remaining++;
            }
        }
    } else {
        category = selectedCategory;
        for (var j = 1; j < category.childNodes.length; j += 2) {
            if (invalidClock < postCount)
                invalidClock++;
            else 
                remaining++;
        }
    }
    return remaining;
}

function getPostCount(postIndex) {
    var postCount = 0;
    for(var i = 1; i < postIndex; i+=2){
        postCount++;
    }
    return postCount;
}

function getPostIndex(postCount) {
    var postIndex = 1;
    for (var i = 0; i < postCount; i++) {
        postIndex += 2;
    }
    return postIndex;
}

function assertCategoryState() {
    if (selectedCategory != pageAssociatedCategory) {
        pageAssociatedCategory = selectedCategory;
        page = 0;
        postCount = 0;
    }
}