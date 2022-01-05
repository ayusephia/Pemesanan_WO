<div class="container-fluid">
	<button class="btn btn-sm btn-primary mb-3" data-toggle="modal" data-target="#tambah_barang"><i class="fas fa-plus fa-sm"></i> Tambah Barang</button>
	<table class="table table-bordered">
		<tr align="center">
			<th>NO</th>
			<th>NAMA BARANG</th>
			<th>KETERANGAN</th>
			<th>KATEGORI</th>
			<th>HARGA</th>
			<th>STOK</th>
			<th colspan="3">AKSI</th>
		</tr>
		<?php 
			$no=1;
			foreach ($barang as $brg) : ?>
			
			<tr>
				<td><?php echo $no++ ?>.</td>
				<td><?php echo $brg->nama_brg ?></td>
				<td><?php echo $brg->keterangan ?></td>
				<td><?php echo $brg->kategori ?></td>
				<td>Rp. <?php echo number_format($brg->harga, 0,',','.') ?></td>
				<td align="center"><?php echo $brg->stok ?></td>
				<td align="center"> <div class="btn btn-success btn-sm"><i class="fas fa-search-plus"></i></div></td>
				<td align="center"><?php echo anchor('admin/data_barang/edit/' .$brg->id_brg, '<div class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></div>') ?> </td>
				<td align="center"><?php echo anchor('admin/data_barang/hapus/' .$brg->id_brg, '<div class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></div>') ?> </td>
			</tr>

		<?php endforeach; ?>
	</table>		
</div>