 <table id="dataTable" class="table table-bordered" cellspacing="0">
          <thead>
            <tr>
                  <th>Barang</th>
                  <th>Jumlah</th>
                  <th>Tanggal Masuk</th>
                  <th>Nama Toko/Pemasok</th>
            </tr>
          </thead>
          <tbody>
              @foreach ($masuk as $m)
              <tr>
                  <td>{{$m->nama_barang}}</td>
                  <td>{{$m->jumlah_asup}}</td>
                  <td>{{$m->tanggal_masuk}}</td>
                  <td>{{$m->nama_toko}}</td>
                  </tr>
              @endforeach
          </tbody>
        </table>