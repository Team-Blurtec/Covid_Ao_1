<?php
// Create database connection
$db = mysqli_connect("localhost", "root", "", "cvao2_db");

// Initialize message variable
$msg = "";

// If upload button is clicked ...
if (isset($_POST['upload'])) {
    // Get image name
    $image = $_FILES['image']['name'];
    $image_text = mysqli_real_escape_string($db, $_POST['image_text']);
    $fonte = mysqli_real_escape_string($db, $_POST['fonte']);
    $titulo = mysqli_real_escape_string($db, $_POST['titulo']);
    $data = date("y-m-d");

    // image file directory
    $target = "images/".basename($image);

    $sql = "INSERT INTO post (image, image_text,fonte,data,titulo) VALUES ('$image', '$image_text','$fonte','$data','$titulo')";
    // execute query
    mysqli_query($db, $sql);

    if (move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
        $msg = "Image uploaded successfully";
    }else{
        $msg = "Failed to upload image";
    }
}
$result = mysqli_query($db, "SELECT * FROM post");
?>
