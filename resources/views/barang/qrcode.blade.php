@extends('layouts.layout')
@section('content')
<title>Data Barang</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

  hr {
    border: none;
    height: 1px;
    /* Set the hr color */
    color: #333; /* old IE */
    background-color: #333; /* Modern Browsers */
  }

  .container {
    position: relative;
  }

  .topright {
    position: absolute;
  }

  .name{
    margin-left: 200px;
    font-size: 12.5pt;
    margin-top: 65px;
  }
  .fieldset-auto-width {
   display: inline-block;
   width: 70%;
   border: 1px solid;
   padding-bottom: 5px;
   margin-bottom: 10px;
   background-image : url("/img/2.jpg");
   background-size: cover;
 }
tr {
  width: 5px;
}
P {
  font-size: 9pt;
  margin-bottom: 0px;
}
</style>
<div class="card-header py-3">
  <h6 class="m-0 font-weight-bold text-dark">QRCode</h6>
</div>
<div id="example">
<div class="container">
<div class="card-body text-center">
 
  <fieldset class="responsive">
    <table width="100%">
      <th><img src="/img/logo1.png" style="width: 65px;"></th>
      <th><P font-size= "10pt">PEMERINTAH DAERAH PROVINSI JAWABARAT</P>
      <P font-size= "10pt">DINAS PENDIDIKAN</P>
      <P>SMA NEGERI 2 GARUT</P>
      <p>Jln. Raya Nagreg KM.37,
Kecamatan Nagreg Kabupaten Bandung 40215</p></th>
      <th><img src="/img/jawa.png" width="58px"></th>
    </table>
   
    <hr>
    <div class="container">
    <div align="center" >
    <h3>QR Code</h3>
    <img src="data:image/png;base64, {!! base64_encode(QrCode::format('png')
                        ->size(150)->errorCorrection('H')
                        ->generate($qrcode->id_barang)) !!} ">
    <h4>{{$qrcode->nama_barang}}</h4>
    </div>
  </div>
      <br>
      <br>
      <br>
    </fieldset>
  </div> 
                        <br>
       </div>
</div>                 
<input type="button" value="Print" class="btn btn-primary" onclick="printDiv(example);"/>


<script>
function printDiv(example) {
      var printContents = document.getElementById("example").innerHTML;    
   var originalContents = document.body.innerHTML;      
   document.body.innerHTML = printContents;     
   window.print();     
   document.body.innerHTML = originalContents;
   }
</script>

@endsection