<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html lang="en"> 
<head>     
    <meta charset="UTF-8">     
    <meta name="viewport" content="width=device-width, initial-scale=1.0">     
    <title>Torchbearer - Traveler & Eatery</title>     
    <link rel="stylesheet" href="styles.css"> <!-- External CSS for custom styles -->     
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Font Awesome for icons -->     
    <style>         
        /* Body and Basic Styling */         
        body {             
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;             
            background-color: #0a1128;             
            color: #ffffff;             
            margin: 0;             
            padding: 0;         
        }          
        header {             
            background-color: #0d47a1;             
            padding: 20px;             
            text-align: center;             
            box-shadow: 0 4px 10px rgba(0, 0, 255, 0.4);             
            display: flex;             
            flex-direction: column;             
            align-items: center;         
        }          
        header h1 {             
            color: #ffffff;             
            font-size: 36px;             
            letter-spacing: 2px;             
            text-transform: uppercase;             
            animation: glow 1.5s infinite alternate;             
            margin: 0;         
        }          
        @keyframes glow {             
            from {                 
                text-shadow: 0 0 10px #2196f3, 0 0 20px #2196f3, 0 0 30px #2196f3, 0 0 40px #42a5f5, 0 0 50px #42a5f5, 0 0 60px #42a5f5;             
            }             
            to {                 
                text-shadow: 0 0 20px #1e88e5, 0 0 30px #64b5f6, 0 0 40px #64b5f6, 0 0 50px #64b5f6, 0 0 60px #64b5f6;             
            }         
        }          
        nav {             
            background-color: #1565c0;             
            padding: 15px;             
            display: flex;             
            justify-content: center;             
            box-shadow: 0 4px 15px rgba(0, 0, 255, 0.3);         
        }          
        nav a {             
            margin: 0 15px;             
            color: white;             
            text-decoration: none;             
            font-weight: bold;             
            padding: 10px;             
            border-radius: 5px;             
            transition: background-color 0.3s ease;         
        }          
        nav a:hover {             
            background-color: #1e88e5;             
            box-shadow: 0 0 15px #42a5f5;         
        }          
        /* Search Bar */         
        .search-container {             
            margin-top: 20px;             
            position: relative;         
        }          
        input[type="text"] {             
            padding: 10px;             
            width: 300px;             
            border-radius: 20px;             
            border: none;         
        }          
        input[type="submit"] {             
            display: none;         
        }          
        .search-icon {             
            position: absolute;             
            right: 10px;             
            top: 50%;             
            transform: translateY(-50%);             
            color: #ffffff;             
            cursor: pointer;         
        }          
        /* Slideshow */         
        .slideshow-container {             
            width: 100%;             
            position: relative;             
            overflow: hidden;         
        }          
        .slides {             
            display: none;             
            width: 100%;             
            height: 500px;         
        }          
        .slides img {             
            width: 100%;             
            height: 100%;         
        }          
        footer {             
            background-color: #0d47a1;             
            color: white;             
            padding: 20px;             
            text-align: center;         
        }     
    </style> 
</head> 
<body>  
    <header>     
        <h1>Torchbearer</h1>     
        <div class="search-container">         
            <form action="searchResults.jsp" method="GET">             
                <input type="hidden" name="source" value="home"> <!-- Indicating source as home -->             
                <input type="text" id="searchBar" name="query" placeholder="Search...">             
                <i class="fas fa-search search-icon" onclick="document.forms[0].submit();"></i>         
            </form>     
        </div> 
    </header>  
    <nav>     
        <a href="events.jsp">Events</a>     
        <a href="teatery.jsp">Eatery</a>     
        <a href="tus.jsp">About Us</a> 
    </nav>  
    <!-- Slideshow Container --> 
    <div class="slideshow-container">     
        <div class="slides fade">         
            <img src="images/City1.jpg" alt="City 1">     
        </div>     
        <div class="slides fade">         
            <img src="images/City2.jpg" alt="City 2">     
        </div>     
        <div class="slides fade">         
            <img src="images/City3.jpg" alt="City 3">      
        </div> 
    </div> <!-- Make sure this closes the slideshow container -->  
    <footer>     
        <p>&copy; 2024 Torchbearer Inc. All Rights Reserved.</p> 
    </footer>  
    <script>     
        let slideIndex = 0;     
        showSlides();      
        function showSlides() {         
            let slides = document.getElementsByClassName("slides");         
            for (let i = 0; i < slides.length; i++) {             
                slides[i].style.display = "none";         
            }         
            slideIndex++;         
            if (slideIndex > slides.length) {slideIndex = 1}         
            slides[slideIndex-1].style.display = "block";         
            setTimeout(showSlides, 4000); // Change image every 4 seconds     
        } 
    </script>  
</body> 
</html>
