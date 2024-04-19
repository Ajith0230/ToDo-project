<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
    background-image: url("https://cdn.pixabay.com/photo/2019/04/29/14/32/make-the-day-great-4166221_1280.jpg");
    background-repeat: no-repeat;
    background-size: 1500px 750px;
}

.a {
   color: white;
   margin-left: 300px;
   position: absolute;
   margin-top: 300px;
   border: 5px solid transparent; /* Set initial border color */
   background-color: black;
   padding: 5px;
   width: 150px;
   text-align: center;
   text-decoration: none;
   transition: border-color 0.5s; /* Smooth transition for border color */
}

</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var a1 = document.getElementById("a1");
    var a2 = document.getElementById("a2");
    var animationInterval; // Variable to store the interval ID

    function animateGradientBorder(element) {
        var i = 0;
        var colors = ['#9B59B6', '#5499C7','#5DADE2','#48C9B0','#F7DC6F']; // Gradient colors
        animationInterval = setInterval(function() {
            element.style.borderImage = "linear-gradient(90deg, " + colors[i] + ", " + colors[(i + 1) % colors.length] + ") 5"; // Changed border width to 5px
            i = (i + 1) % colors.length;
        }, 100); // Interval for smooth animation
    }

    function stopAnimation() {
        console.log("Stopping animation");
        clearInterval(animationInterval); // Clear the interval to stop the animation
        a1.style.borderImage= "none"; // Reset border color
        a2.style.borderImage = "none"; // Reset border color
    }

    a1.addEventListener("mouseenter", function() {
        animateGradientBorder(a1);
    });
    a1.addEventListener("mouseleave", stopAnimation);

    a2.addEventListener("mouseenter", function() {
        animateGradientBorder(a2);
    });
    a2.addEventListener("mouseleave", stopAnimation);
});

</script>
</head>
<body>
    <h1><a id="a1" class="a" href="signup.jsp">Sign-up</a><br><br></h1>
    <h1><a id="a2" class="a" href="login.jsp">Log-in</a></h1>
</body>
</html>
