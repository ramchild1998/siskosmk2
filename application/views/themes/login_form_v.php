<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LOGIN - SISKOSMK2BTM</title>
	<link rel="shortcut icon" href="<?php echo base_url(); ?>icon.ico" type="image/x-icon" />
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!-- bootstrap 3.0.2 -->
	<link href="<?php echo base_url(); ?>assets/theme_admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- font Awesome -->
	<link href="<?php echo base_url(); ?>assets/theme_admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<!-- Theme style -->
	<link href="<?php echo base_url(); ?>assets/theme_admin/css/AdminLTE3.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url(); ?>assets/theme_admin/css/custome.css" rel="stylesheet" type="text/css" />

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<br><br>
	
	<p align="center">
		
	</p>
	<div class="form-box" id="login-box">
		<div class="header"><img height='85' src="<?php echo base_url().'assets/theme_admin/img/logo2.png'; ?>"></div>
		<form action="" method="post">
			<div class="body bg-gray">
				<?php if($jenis == 'member') { ?>
					<h4>Member Login - <a href="<?php echo site_url('login'); ?>" class="btn btn-success">Admin/Operator</a></h4>
				<?php } else { ?>
					<h4>Admin & Operator Login - <a href="<?php echo site_url('member'); ?>" class="btn btn-success">Member</a></h4>
				<?php } ?>

				<?php 
				if (!empty($pesan)) {
					echo '<div style="color: red;">' . $pesan . '</div>';
				}
				?>
				<div class="form-group">
					<input type="text" name="u_name" id="u_name" class="form-control" placeholder="Username" value="<?php echo set_value('u_name');?>" />
					<?php echo form_error('u_name', '<p style="color: red;">', '</p>');?>
				</div>
				<div class="form-group">
					<input type="password" name="pass_word" class="form-control" placeholder="Password" />
					<?php echo form_error('pass_word', '<p style="color: red;">', '</p>');?>
				</div> 
				<button type="submit" class="btn btn-success btn-block">Login</button>
			</div>
			<div class="footer"> 
		<div align="center">Sistem Koperasi SMKN 2 Batam &copy; Copyright <?php echo date('Y'); ?></div> 
			</div>
		</form>
	</div>

	<!-- jQuery 2.0.2 -->
	<script src="<?php echo base_url(); ?>assets/theme_admin/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="<?php echo base_url(); ?>assets/theme_admin/js/bootstrap.min.js" type="text/javascript"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#u_name').focus();
	});
</script>

</body>
</html>