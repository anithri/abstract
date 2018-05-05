class Worker < ActiveHash::Base

  self.data = [
    { id: 11, name: 'workerRed', theme: 'workerRed' },
    { id: 12, name: 'workerBlue', theme: 'workerBlue' },
    { id: 13, name: 'workerGreen', theme: 'workerGreen' },
    { id: 14, name: 'workerPurple', theme: 'workerPurple' }
  ]
end
