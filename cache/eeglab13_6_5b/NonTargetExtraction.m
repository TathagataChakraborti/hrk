EEG = pop_epoch(EEG, {'1'}, [-1 2], 'newname', 'epochs_t'); % targets
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off');
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-1000 0]); % remove baseline
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'overwrite','on','gui','off');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',1,'study',0);
EEG = eeg_checkset( EEG );
eeglab redraw
EEG = pop_epoch(EEG, {'2'}, [-1 2], 'newname', 'epochs_nt'); % non-targets
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG,1,'gui','off');
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-1000 0]); % remove baseline
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'overwrite','on','gui','off');
eeglab redraw