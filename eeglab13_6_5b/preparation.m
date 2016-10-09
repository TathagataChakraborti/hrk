% import data from testbench csv file
tbdata = importdata('input.csv');
eegdata = tbdata.data;
% remove unwanted fields
eegdata(:,21:40) = [];
eegdata(:,17:19) = [];
eegdata(:,1:2) = [];
eegdata = eegdata';
% Prepare data in EEGLAB
eeglab
EEG = pop_importdata('data',eegdata,'srate',128); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname','eegdata','gui','off');
EEG = eeg_checkset( EEG );
EEG = pop_chanevent(EEG,15,'edge','leading','edgelen',0); % event channel
EEG = pop_chanedit(EEG, 'load',{'emotiv.ced' 'filetype' 'autodetect'}); % channel locations
EEG = pop_eegfilt(EEG, 7, 0, [], [0]); 
EEG = pop_eegfilt(EEG, 0, 13, [], [0]); 
eeglab redraw