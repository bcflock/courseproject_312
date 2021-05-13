from mpi4py import MPI
import h5py

rank = MPI.COMM_WORLD.rank

f = h5py.File('data/data.hdf5', 'w', driver='mpio', comm=MPI.COMM_WORLD)
dset = f.create_dataset('test', (4,), dtype='i')
dset[rank]=rank

f.close()