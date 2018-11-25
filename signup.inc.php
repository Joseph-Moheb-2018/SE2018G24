<?php
if(isset($_POST['submit'])) {

	require 'dbh.inc.php' ;

	$username=$_POST['uid'];
	$email=$_POST['mail'];
	$password=$_POST['pwd'];
	$passwordRepeat=$_POST['pwd-repeat'];

	if(empty($username)||empty($email) ||empty($password) || empty($passwordRepeat))
	{


		header("Location:../signup.php?error=emptyfields&uid=".$username."&mail=".$email);
		exit();
	}
else if (!filter_var($email,FILTER_VALIDATE_EMAIL)) {
	header("Location:../signup.php?error=invalidmail&uid=".$username);

		exit();	
	}

else if ($password !== $passwordRepeat) {
	header("Location:../signup.php?error=passwordcheck&uid=".$username."&mail=".$email);
		exit();

		}

		else {
			$sql="SELECT uidUsers FROM users WHERE uidUsers=? " ;
			$stmt =mysqli_stmt_init($conn) ;
			if (!mysqli_stmt_prepare ($stmt,$sql)) {
				header("Location:../signup.php?error=sqlerror");
		exit();
			}
			else {
				mysqli_stmt_bind_param ($stmt,"s",$username) ;
				mysqli_stmt_execute($stmt);
				mysqli_stmt_store_result($stmt);
				$resultcheck=mysqli_stmt_num_rows($stmt);
				if($resultcheck>0) {
					header("Location:../signup.php?usertaken&mail=".$email);
		exit();
				}
				else {
					$sql="INSERT INTO users (uidUsers, emailUsers,pwdUsers) VALUES (?,?,?) ";
					$stmt=mysqli_stmt_init($conn);
					if(!mysqli_stmt_prepare($stmt,$sql)) {
						header("Location:../signup.php?error=sqlerror");

					}
					else {

						$hashedpwd=password_hash($password,PASSWORD_DEFAULT);
				mysqli_stmt_bind_param ($stmt,"sss",$username,$email,$hashedpwd) ;
				mysqli_stmt_execute($stmt);
				header("Location:../signup.php?signup=success");
				exit();
				}
			}
		}
}
mysqli_stmt_close($stmt);
mysqli_close($conn);

}
else {
	header("Location:../signup.php");
	exit();
}