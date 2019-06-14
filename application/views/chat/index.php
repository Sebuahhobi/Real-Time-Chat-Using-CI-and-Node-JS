<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
    <style type="text/css">
      .selector-for-some-widget {
        box-sizing: content-box;
      }
    </style>

    <title>Hello, world!</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row" style="padding-top: 20px; padding-left: 20px;">
        <div class="col">
          <div class="card">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-6">
                  <ul class="list-group" id="list">
                    
                  </ul>
                </div>
              </div>
              <div class="row" style="padding-top: 10px;">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="exampleFormControlTextarea1">Chat Input</label>
                    <input class="form-control" id="input">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="<?php echo base_url();?>node_modules/socket.io/node_modules/socket.io-client/socket.io.js"></script>
    <script src="assets/js/jquery.min.js"></script>
  <script>
    $(document).ready(function(){
      var socket = io.connect( 'http://'+window.location.hostname+':3000' );

      $(function(){
        $.ajaxSetup({
          type     : "get",
          dataType : 'json',
          url      : "<?php echo base_url('chat/get_chat_bootstrap'); ?>",
          cache    : false,
        });
        $.ajax({
          data    : {tahun:''},
          success : function(data){
            var i=0;          
            data.text.forEach(function(obj){
              $('#list').append('<li class="list-group-item">'+data.waktu[i]+' '+data.nama_pengirim[i]+': '+data.text[i]+'</li>');
              i++;
            });
          }//END success
        })
      });

      $("#input").change(function(){
        <?php
          $user=$this->ion_auth->user()->row();
          date_default_timezone_set('Asia/jakarta');
        ?>

        var value=$('#input').val();
        var waktu="<?php echo date('Y-m-d H:m:s');?>";
        var nama_pengirim="<?php echo $user->first_name;?>";
        $(function(){
            $.ajaxSetup({
              type     : "get",
              dataType : 'html',
              url      : "<?php echo base_url('chat/input_chat'); ?>",
              cache    : false
            });
            $.ajax({
              data    : {text:value, nama_pengirim:nama_pengirim, waktu:waktu},
              success : function(data){
                socket.emit('new_count_message', { 
                  new_count_message: data.new_count_message
                });
                socket.emit('chats', { 
                  isi   : value,
                  nama  : nama_pengirim,
                  waktu : waktu
                });

                $('#input').val('');
              }//END success
            });
          });

      });

      socket.on( 'chats', function( data ) {
        $('#list').append('<li class="list-group-item">'+data.waktu+' '+data.nama_pengirim+': '+data.text+'</li>');
      });
    });
  </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="<?php echo base_url();?>assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>