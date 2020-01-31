% function testsim_distractor_LG_KK_SDT
clear all

% predictions

% Legend
%       contra | ispi
% pre     1       2
% post    3       4

%%
IndependentCalculation = 0; % for double stimuli, using all three outcomes (dependent) or only two out of three (independent for contra/ipsi)
n_trials = 100; % for each stimulus condition
%%
%scenario = 'Single Stimuli: Pre: no spatial bias, add spatial bias to contra';
% scenario = 'add spatial bias to contra and ipsi';
% scenario = 'contra perceptual problem';
% scenario = 'high hit rate, but ipsi spatial bias'; % like Curius early stim single targets, difficult distractor

%% DOUBLE STIMULI
 %scenario = 'DoubleStimuli - Post: ipsi selection Bias (saccade), NO perceptual deficit';
 %scenario = 'DoubleStimuli - Post: ipsi motor Bias (saccade), perceptual deficit';

% scenario = 'Double Stimuli - Post: contra perceptual deficit';
% scenario = 'Double Stimuli - Post: contra motor bias for saccades, contra perceptual deficit';
% scenario = 'Double Stimuli - Pre: No spatial choice bias & Post: ipsi choice Bias';

% scenario = 'Double Stimuli - Curius inactivation session 7 20190913'; 
 scenario = 'Double D-T Stimuli - Post: ipsi choice Bias';


% Enter the Proportion for Hits, Misses, FA, CR
switch scenario
    
    case 'Single Stimuli: Pre: no spatial bias, add spatial bias to contra';
        disp('Single Stimuli: Pre: no spatial bias, add spatial bias to contra')
        StimulusType = 'Sgl_Stimuli'; 

        IndependentCalculation = 1;
        H(1)   = 0.7; %0.7
        M(1)   = 0.3; %0.3
        FA(1)  = 0.3;
        CR(1)  = 0.7;
        
        H(2)   = 0.6;
        M(2)   = 0.4;
        FA(2)  = 0.4;
        CR(2)  = 0.6;
        
        sb = 0.19;
        H(3)   = H(1)+sb;
        M(3)   = M(1)-sb;
        FA(3)  = FA(1)+sb;
        CR(3)  = CR(1)-sb;
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);
        
    case 'add spatial bias to contra and ipsi';
                     StimulusType = 'Sgl_Stimuli'; 

        H(1)   = 0.7;
        M(1)   = 0.3;
        FA(1)  = 0.25;
        CR(1)  = 0.75;
        
        H(2)   = 0.6;
        M(2)   = 0.4;
        FA(2)  = 0.4;
        CR(2)  = 0.6;
        
        sb = 0.2;
        H(3)   = H(1)+sb;
        M(3)   = M(1)-sb;
        FA(3)  = FA(1)+sb;
        CR(3)  = CR(1)-sb;
        
        H(4)   = H(2)-sb;
        M(4)   = M(2)+sb;
        FA(4)  = FA(2)-sb;
        CR(4)  = CR(2)+sb;
        
        
    case 'contra perceptual problem';
                     StimulusType = 'Sgl_Stimuli'; 

        H(1)   = 0.7;
        M(1)   = 0.3;
        FA(1)  = 0.25;
        CR(1)  = 0.75;
        
        H(2)   = 0.6;
        M(2)   = 0.4;
        FA(2)  = 0.4;
        CR(2)  = 0.6;
        sb = 0.15;
        
        %general increase in errors: reduce Hits, increase Miss, reduce CR, increase FA
        H(3)   = H(1) - sb; % 0.55;
        M(3)   = M(1) + sb; %0.45;
        FA(3)  = FA(1)+ sb; %0.45;
        CR(3)  = CR(1)- sb; %0.55;
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);
        
    case 'high hit rate, but ipsi spatial bias';
             StimulusType = 'Sgl_Stimuli'; 

        H(1)   = 0.9;
        M(1)   = 0.1;
        FA(1)  = 0.25;
        CR(1)  = 0.75;
        
        H(2)   = 0.9;
        M(2)   = 0.1;
        FA(2)  = 0.7;
        CR(2)  = 0.3;
        
        sb = 0.1;
        H(3)   = H(1);
        M(3)   = M(1);
        FA(3)  = FA(1);
        CR(3)  = CR(1);
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2)+sb;
        CR(4)  = CR(2)-sb;
    case 'DoubleStimuli - Post: ipsi motor Bias (saccade), perceptual deficit';
       disp('DoubleStimuli - Post: ipsi motor Bias (saccade), perceptual deficit')
             StimulusType = 'Double_Stimuli'; 

        % A condition for double stimuli: Fixation is the same for contra vs ipsi M(1) = M(2)
        % spatial-saccade choice bias  (ipsi) without same discrimination performance 
        % Pre: no choice bias -> Post: ipsi choice bias -> fixations do not change for both hemifields
        % Post: ipsi targets are highly selected
        % H(1) + M(1) + H(2) should add to 1
        % FA(1) + CR(1) + FA(2) should add to 1
        
        % contra pre
        H(1)   = 0.45;
        M(1)   = 0.1;
        FA(1)  = 0.2;
        CR(1)  = 0.6;
        
        % ipsi pre
        H(2)   = 0.45;
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ; %Target:less saccades to contra
        M(3)   = M(1);
        FA(3)  = FA(1)- sb; %Distractor: less saccades to contra
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)+ sb ; %Target:more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2)+ sb; %Distractor: less saccades to contra
        CR(4)  = CR(3);
        
        if H(1)+ M(1)+ H(2) == 1
            disp('Pre: target-trials: add up to 1')
        end
        if FA(1)+ CR(1)+ FA(2) == 1
            disp('Pre: distractor-trials: add up to 1')
        end
        if H(3)+ M(3)+ H(4) == 1
            disp('Post: target-trials: add up to 1')
        end
        if FA(3)+ CR(3)+ FA(4) == 1
            disp('Post: distractor-trials: add up to 1')
        end
    
    case 'DoubleStimuli - Post: ipsi selection Bias (saccade), NO perceptual deficit';
       disp('DoubleStimuli - Post: ipsi selection Bias (saccade), NO perceptual deficit')
             StimulusType = 'Double_Stimuli'; 

        % A condition for double stimuli: Fixation is the same for contra vs ipsi M(1) = M(2)
        % spatial-saccade choice bias  (ipsi) without same discrimination performance 
        % Pre: no choice bias -> Post: ipsi choice bias -> fixations do not change for both hemifields
        % Post: ipsi targets are highly selected
        % H(1) + M(1) + H(2) should add to 1
        % FA(1) + CR(1) + FA(2) should add to 1
        
        % contra pre
        H(1)   = 0.45;
        M(1)   = 0.1;
        FA(1)  = 0.2;
        CR(1)  = 0.6;
        
        % ipsi pre
        H(2)   = 0.45;
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ; %less saccades to contra
        M(3)   = M(1);
        FA(3)  = FA(1)- sb; %less saccades to contra
        CR(3)  = CR(1)+ sb ;
        
        % ispi post
        H(4)   = H(2)+ sb ; %more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2); %+ sb;
        CR(4)  = CR(3);
        
        if H(1)+ M(1)+ H(2) == 1
            disp('Pre: target-trials: add up to 1')
        end
        if FA(1)+ CR(1)+ FA(2) == 1
            disp('Pre: distractor-trials: add up to 1')
        end
        if H(3)+ M(3)+ H(4) == 1
            disp('Post: target-trials: add up to 1')
        end
        if FA(3)+ CR(3)+ FA(4) == 1
            disp('Post: distractor-trials: add up to 1')
        end
    
    case 'Double Stimuli - Post: contra perceptual deficit';
disp('Double Stimuli - Post: contra perceptual deficit') 
             StimulusType = 'Double_Stimuli'; 
% perceptual deficit: increasing errors
%
    % contra pre
        H(1)   = 0.45;
        M(1)   = 0.1;
        FA(1)  = 0.2;
        CR(1)  = 0.6;
        
        % ipsi pre
        H(2)   = 0.45;
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ;
        M(3)   = M(1)+ sb; %contra fixation
        FA(3)  = FA(1)+ sb;%contra Saccade
        CR(3)  = CR(1)- sb;
        
        % ispi post
        H(4)   = H(2) ;
        M(4)   = M(3);
        FA(4)  = FA(2);
        CR(4)  = CR(3);
        
        if H(1)+ M(1)+ H(2) == 1
            disp('Pre: target-trials: add up to 1')
        end
        if FA(1)+ CR(1)+ FA(2) == 1
            disp('Pre: distractor-trials: add up to 1')
        end
        if H(3)+ M(3)+ H(4) == 1
            disp('Post: target-trials: add up to 1')
        end
        if FA(3)+ CR(3)+ FA(4) == 1
            disp('Post: distractor-trials: add up to 1')
        end
    
    case 'Double Stimuli - Post: contra motor bias for saccades, contra perceptual deficit';
disp('Double Stimuli - Post: contra motor bias for saccades, contra perceptual deficit') 
             StimulusType = 'Double_Stimuli'; 
% perceptual deficit: increasing fixation responses
% motor bias for saccades
    % contra pre
        H(1)   = 0.45;
        M(1)   = 0.1;
        FA(1)  = 0.2;
        CR(1)  = 0.6;
        
        % ipsi pre
        H(2)   = 0.45;
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1) ;
        M(3)   = M(1); %contra fixation
        FA(3)  = FA(1)+ sb;%contra Saccade
        CR(3)  = CR(1)- sb;
        
        % ispi post
        H(4)   = H(2) ;
        M(4)   = M(3);
        FA(4)  = FA(2);
        CR(4)  = CR(3);
        
        if H(1)+ M(1)+ H(2) == 1
            disp('Pre: target-trials: add up to 1')
        end
        if FA(1)+ CR(1)+ FA(2) == 1
            disp('Pre: distractor-trials: add up to 1')
        end
        if H(3)+ M(3)+ H(4) == 1
            disp('Post: target-trials: add up to 1')
        end
        if FA(3)+ CR(3)+ FA(4) == 1
            disp('Post: distractor-trials: add up to 1')
        end
 
    case 'Double Stimuli - Pre: No spatial choice bias & Post: perceptual deficit';
        disp('Double Stimuli - Pre: No spatial choice bias & Post: perceptual deficit')        
             StimulusType = 'Double_Stimuli'; 

        % contra pre
        H(1)   = 0.5;
        M(1)   = 0.2;
        FA(1)  = 0.1; %0.1;
        CR(1)  = 0.5; %0.6;
        
        % ipsi pre
        H(2)   = 0.3;
        M(2)   = M(1);
        FA(2)  = 0.4;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ;
        M(3)   = M(1)+ sb;
        FA(3)  = FA(1)+sb;
        CR(3)  = CR(1)- sb;
        
        % ispi post
        H(4)   = H(2) ;
        M(4)   = M(3);
        FA(4)  = FA(2);
        CR(4)  = CR(3);
        
        if H(1)+ M(1)+ H(2) == 1
            disp('Pre: target-trials: add up to 1')
        end
        if FA(1)+ CR(1)+ FA(2) == 1
            disp('Pre: distractor-trials: add up to 1')
        end
        if H(3)+ M(3)+ H(4) == 1
            disp('Post: target-trials: add up to 1')
        end
        if FA(3)+ CR(3)+ FA(4) == 1
            disp('Post: distractor-trials: add up to 1')
        end
        


        
  case 'Double Stimuli - Curius inactivation session 7 20190913';
             StimulusType = 'Double_Stimuli'; 
  
      % spatial choice bias  (ipsi) with good discrimination performance
        % for distractors
        % Fixation is the same for contra vs ipsi M(1) = M(2)

        % Pre: no choice bias -> Post: ipsi choice bias -> fixations doesn't change for both hemifields
        % target are highly selected
        % H(1) + M(1) + H(2) should add to 1
        %pre 26/67 + 1/67  + 40/67 
        %pst 11/61 + 0/61 +50/61
        % FA(1) + CR(1) + FA(2) should add to 1
        
        % contra pre
        H(1)   = 26/67;
        M(1)   = 1/67;
        FA(1)  = 21/65;
        CR(1)  = 23/65;
        
        % ipsi pre
        H(2)   = 40/67;
        M(2)   = M(1);
        FA(2)  = 21/65;
        CR(2)  = CR(1);
        
        % contra post
        H(3)   = 11/61 ;
        M(3)   = 0/61;
        FA(3)  = 19/62;
        CR(3)  = 19/62;
        
        % ispi post
        H(4)   = 50/61 ;
        M(4)   = M(3);
        FA(4)  = 24/62;
        CR(4)  = CR(3);  
        if H(1)+ M(1)+ H(2) == 1
            disp('target-trials: add up to 1')
        end
        if FA(1)+ CR(1)+ FA(2) == 1
            disp('distractor-trials: add up to 1')
        end
     
    case 'Double D-T Stimuli - Post: ipsi choice Bias';
       StimulusType = 'Double D-T Stimuli'; 
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1 
        % ipsi selection bias - increase ipsilateral target selection 
        % No perceptual deficit - no change for ipsilateral distractor trials
        
        % contra pre
            % contra pre
        H(1)   = 0.5;
        M(1)   = 0.2;
        FA(1)  = 0.2; %0.1;
        CR(1)  = 0.5; %0.6;
        
        % ipsi pre
        H(2)   = 0.3;
        M(2)   = CR(1);
        FA(2)  = 0.3;
        CR(2)  = M(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1) ;
        M(3)   = M(1);
        FA(3)  = FA(1)- sb;
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)+ sb ;
        M(4)   = CR(3);
        FA(4)  = FA(2);
        CR(4)  = M(3);
        
        if H(1)+ M(1)+ FA(2) == 1 
            disp('Pre: target-trials: add up to 1')
        end
        if FA(1)+ CR(1)+ H(2) == 1 
            disp('Pre: distractor-trials: add up to 1')
        end
        if H(3)+ M(3)+ FA(4) == 1
            disp('Post: target-trials: add up to 1')
        end
        if FA(3)+ CR(3)+ H(4) == 1
            disp('Post: distractor-trials: add up to 1')
        end
end


%% It should be before the dprime calculation because 0.5 is added to the Nb.of trials
%% all rewarded trials (hits & CR)/ all trials

% avoid 0 or Inf probabilities
if any(H==0) || any(M==0) || any(FA==0) || any(CR==0),
    % add 0.5 to both the number of hits and the number of false alarms,
    % add 1 to both the number of signal trials and the number of noise trials; dubbed the loglinear approach (Hautus, 1995)
    
    disp('correcting...');
    
    n_trials = n_trials + 1;
    
    H = single(H*n_trials);
    M = single(M*n_trials);
    FA = single(FA*n_trials);
    CR = single(CR*n_trials);
    
    if strcmp(StimulusType , 'Double D-T Stimuli')
Accuracy(1) = (H(2)+H(1))/(H(1) + FA(2) + M(1) +  FA(1)+ CR(1)+ H(2) ); 
Accuracy(2) = (H(4)+H(3))/(H(3) +  FA(4)  + M(3) +  FA(3)+ CR(3)+ H(4)); 

%TargetSelection
Tar_IpsiSelection(1)    = H(2) ./ (FA(1) + H(2) + M(1)); %ipsi
Tar_ContraSelection(1)  = H(1) ./ (H(1) + FA(2) + M(1));
Tar_fixation(1)         = M(1) ./ (FA(1) + H(2) + M(1));
Tar_IpsiSelection(2)    = H(4) ./ (FA(3) + H(4) + M(3));
Tar_ContraSelection(2)  = H(3) ./ (H(3) + FA(4) + M(3));
Tar_fixation(2)         = M(3) ./ (FA(3) + H(4) + M(3));
%DistractorSelection
Dis_IpsiSelection(1)    = FA(2)./ (H(1) + FA(2) + CR(1)); %ipsi
Dis_ContraSelection(1)  = FA(1)./ (FA(1) + H(2) + CR(1));
Dis_fixation(1)         = CR(1) ./ (H(1) + FA(2) + CR(1));
Dis_IpsiSelection(2)    = FA(4)./ (H(3) + FA(4) + CR(3));
Dis_ContraSelection(2)  = FA(3)./ (FA(3) + H(4) + CR(3));
Dis_fixation(2)         = CR(3) ./ (H(3) + FA(4) + CR(3));
    elseif strcmp(StimulusType , 'Double_Stimuli')
        
Accuracy(1) = (H(2)+H(1)+ CR(1))/(H(1) + H(2) + M(1) +  FA(1)+ CR(1)+ FA(2)); 
Accuracy(2) = (H(4)+H(3)+ CR(3))/   (H(3) + H(4) + M(3) +  FA(3)+ CR(3)+ FA(4));
%TargetSelection
Tar_IpsiSelection(1)    = H(2) ./ (H(1) + H(2) + M(1)); %ipsi
Tar_ContraSelection(1)  = H(1) ./ (H(1) + H(2) + M(1));
Tar_fixation(1)         = M(1) ./ (H(1) + H(2) + M(1));
Tar_IpsiSelection(2)    = H(4) ./ (H(3) + H(4) + M(3));
Tar_ContraSelection(2)  = H(3) ./ (H(3) + H(4) + M(3));
Tar_fixation(2)         = M(3) ./ (H(3) + H(4) + M(3));
%DistractorSelection
Dis_IpsiSelection(1)    = FA(2)./ (FA(1) + FA(2) + CR(1)); %ipsi
Dis_ContraSelection(1)  = FA(1)./ (FA(1) + FA(2) + CR(1));
Dis_fixation(1)         = CR(1) ./ (FA(1) + FA(2) + CR(1));
Dis_IpsiSelection(2)    = FA(4)./ (FA(3) + FA(4) + CR(3));
Dis_ContraSelection(2)  = FA(3)./ (FA(3) + FA(4) + CR(3));
Dis_fixation(2)         = CR(3) ./ (FA(3) + FA(4) + CR(3));

    elseif strcmp(StimulusType , 'Sgl_Stimuli')
Accuracy(1) = (H(2)+H(1)+ CR(1)+ CR(2))/(H(1) + H(2) + M(1)+ M(2)+CR(2) +  FA(1)+ CR(1)+ FA(2)); 
Accuracy(2) = (H(4)+H(3)+ CR(3)+ CR(4))/   (H(3) + H(4) + M(3)+ M(4)+ CR(4) +  FA(3)+ CR(3)+ FA(4));
%TargetSelection
Tar_IpsiSelection(1)    = H(2) ./ (H(2) + M(2)); %ipsi
Tar_ContraSelection(1)  = H(1) ./ (H(1) + M(1));
Tar_fixation(1)         = M(1) ./ (H(1) + M(1));
Tar_IpsiSelection(2)    = H(4) ./ (H(4) + M(4));
Tar_ContraSelection(2)  = H(3) ./ (H(3) + M(3));
Tar_fixation(2)         = M(3) ./ (H(3) + M(3));
%DistractorSelection
Dis_IpsiSelection(1)    = FA(2)./ (FA(2) + CR(2)); %ipsi
Dis_ContraSelection(1)  = FA(1)./ (FA(1) + CR(1));
Dis_fixation(1)         = CR(1)./ (FA(1)+ CR(1));
Dis_IpsiSelection(2)    = FA(4)./ (FA(4) + CR(4));
Dis_ContraSelection(2)  = FA(3)./ (FA(3) + CR(3));
Dis_fixation(2)         = CR(3)./ (FA(3) + CR(3));
    end


    
    
    H = H + 0.5;
    M = M + 0.5;
    FA = FA + 0.5;
    CR = CR + 0.5;
    
else
    
    
    H = single(H*n_trials);
    M = single(M*n_trials);
    FA = single(FA*n_trials);
    CR = single(CR*n_trials);
    
    
    
    if strcmp(StimulusType , 'Double D-T Stimuli')
Accuracy(1) = (H(2)+H(1))/(H(1) + FA(2) + M(1) +  FA(1)+ CR(1)+ H(2) ); 
Accuracy(2) = (H(4)+H(3))/(H(3) +  FA(4)  + M(3) +  FA(3)+ CR(3)+ H(4)); 

%TargetSelection
Tar_IpsiSelection(1)    = H(2) ./ (FA(1) + H(2) + M(1)); %ipsi
Tar_ContraSelection(1)  = H(1) ./ (H(1) + FA(2) + M(1));
Tar_fixation(1)         = M(1) ./ (FA(1) + H(2) + M(1));
Tar_IpsiSelection(2)    = H(4) ./ (FA(3) + H(4) + M(3));
Tar_ContraSelection(2)  = H(3) ./ (H(3) + FA(4) + M(3));
Tar_fixation(2)         = M(3) ./ (FA(3) + H(4) + M(3));
%DistractorSelection
Dis_IpsiSelection(1)    = FA(2)./ (H(1) + FA(2) + CR(1)); %ipsi
Dis_ContraSelection(1)  = FA(1)./ (FA(1) + H(2) + CR(1));
Dis_fixation(1)         = CR(1) ./ (H(1) + FA(2) + CR(1));
Dis_IpsiSelection(2)    = FA(4)./ (H(3) + FA(4) + CR(3));
Dis_ContraSelection(2)  = FA(3)./ (FA(3) + H(4) + CR(3));
Dis_fixation(2)         = CR(3) ./ (H(3) + FA(4) + CR(3));
    elseif strcmp(StimulusType , 'Double_Stimuli')
        
Accuracy(1) = (H(2)+H(1)+ CR(1))/(H(1) + H(2) + M(1) +  FA(1)+ CR(1)+ FA(2)); 
Accuracy(2) = (H(4)+H(3)+ CR(3))/   (H(3) + H(4) + M(3) +  FA(3)+ CR(3)+ FA(4));
%TargetSelection
Tar_IpsiSelection(1)    = H(2) ./ (H(1) + H(2) + M(1)); %ipsi
Tar_ContraSelection(1)  = H(1) ./ (H(1) + H(2) + M(1));
Tar_fixation(1)         = M(1) ./ (H(1) + H(2) + M(1));
Tar_IpsiSelection(2)    = H(4) ./ (H(3) + H(4) + M(3));
Tar_ContraSelection(2)  = H(3) ./ (H(3) + H(4) + M(3));
Tar_fixation(2)         = M(3) ./ (H(3) + H(4) + M(3));
%DistractorSelection
Dis_IpsiSelection(1)    = FA(2)./ (FA(1) + FA(2) + CR(1)); %ipsi
Dis_ContraSelection(1)  = FA(1)./ (FA(1) + FA(2) + CR(1));
Dis_fixation(1)         = CR(1) ./ (FA(1) + FA(2) + CR(1));
Dis_IpsiSelection(2)    = FA(4)./ (FA(3) + FA(4) + CR(3));
Dis_ContraSelection(2)  = FA(3)./ (FA(3) + FA(4) + CR(3));
Dis_fixation(2)         = CR(3) ./ (FA(3) + FA(4) + CR(3));

    elseif strcmp(StimulusType , 'Sgl_Stimuli')
Accuracy(1) = (H(2)+H(1)+ CR(1)+ CR(2))/(H(1) + H(2) + M(1)+ M(2)+CR(2) +  FA(1)+ CR(1)+ FA(2)); 
Accuracy(2) = (H(4)+H(3)+ CR(3)+ CR(4))/   (H(3) + H(4) + M(3)+ M(4)+ CR(4) +  FA(3)+ CR(3)+ FA(4));
%TargetSelection
Tar_IpsiSelection(1)    = H(2) ./ (H(2) + M(2)); %ipsi
Tar_ContraSelection(1)  = H(1) ./ (H(1) + M(1));
Tar_fixation(1)         = M(1) ./ (H(1) + M(1));
Tar_IpsiSelection(2)    = H(4) ./ (H(4) + M(4));
Tar_ContraSelection(2)  = H(3) ./ (H(3) + M(3));
Tar_fixation(2)         = M(3) ./ (H(3) + M(3));
%DistractorSelection
Dis_IpsiSelection(1)    = FA(2)./ (FA(2) + CR(2)); %ipsi
Dis_ContraSelection(1)  = FA(1)./ (FA(1) + CR(1));
Dis_fixation(1)         = CR(1)./ (FA(1)+ CR(1));
Dis_IpsiSelection(2)    = FA(4)./ (FA(4) + CR(4));
Dis_ContraSelection(2)  = FA(3)./ (FA(3) + CR(3));
Dis_fixation(2)         = CR(3)./ (FA(3) + CR(3));
    end
end


if IndependentCalculation == 1
    pHit = H ./ (H + M);
    pFA = FA ./ (FA + CR);
else
     if strcmp(StimulusType , 'Double_Stimuli')

    H_ = [H(2) H(1) H(4) H(3) ];
    FA_ = [FA(2) FA(1) FA(4) FA(3) ];
    pHit = H ./ (H + M +H_);
    pFA = FA ./ (FA + CR +FA_);
     elseif strcmp(StimulusType , 'Double D-T Stimuli')
    H_ = [H(2) H(1) H(4) H(3) ];
    FA_ = [FA(2) FA(1) FA(4) FA(3) ];
    pHit = H ./ (H + M +FA_);
    pFA = FA ./ (FA + CR +H_);
         
     end
end

for k = 1:4,
    [dprime(k),beta(k),criterion(k)] = testsim_dprime(pHit(k),pFA(k));
end

%% Graph
% Selection 
Plot_Rows = 3; 
Plot_Colums = 3; 
MarkSize = 10; 
figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
if IndependentCalculation == 1
    Title = 'pHit/FA independent Calculation: '; 
    mult = -1; 
else
    Title = 'pHit/FA dependent Calculation'; 
    mult = -1;
end
set(gcf,'Name',[Title, '  Selection, Dprime, Criterion' ,scenario]);
set(gcf,'Color',[1 1 1]);
title([scenario sprintf('\n')])


    subplot(Plot_Colums,Plot_Rows,1);
    plot([1;2], [Tar_IpsiSelection(1),Tar_IpsiSelection(2)], 'o','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 1 ]); hold on;
    plot([1;2], [Tar_ContraSelection(1),Tar_ContraSelection(2)], 'o','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 0 0 ]); hold on;
    line([1;2], [Tar_ContraSelection(1),Tar_ContraSelection(2)], 'Color',[1 0 0],'LineWidth', 2); hold on; 
    line([1;2], [Tar_IpsiSelection(1),Tar_IpsiSelection(2)], 'Color',[0 0 1],'LineWidth', 2); hold on;
    plot([1;2], [Tar_fixation(1),Tar_fixation(2)], 'o','color',[0 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 0 ]); hold on;
    line([1;2], [Tar_fixation(1),Tar_fixation(2)], 'Color',[0 0 0],'LineWidth', 2); hold on;
    
    set(gca,'ylim',[0 1])
    ylabel( 'target selection','fontsize',14,'fontweight','b', 'Interpreter', 'none' );
    set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',20);
    legend('ipsi', 'con')


    subplot(Plot_Colums,Plot_Rows,2);
   
    plot([1;2], [Dis_IpsiSelection(1),Dis_IpsiSelection(2)], 'o','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 1 ]); hold on;
    plot([1;2], [Dis_ContraSelection(1),Dis_ContraSelection(2)], 'o','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 0 0 ]); hold on;
    line([1;2], [Dis_ContraSelection(1),Dis_ContraSelection(2)], 'Color',[1 0 0],'LineWidth', 2); hold on; 
    line([1;2], [Dis_IpsiSelection(1),Dis_IpsiSelection(2)], 'Color',[0 0 1],'LineWidth', 2); hold on;
    plot([1;2], [Dis_fixation(1),Dis_fixation(2)], 'o','color',[0 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 0 ]); hold on;
    line([1;2], [Dis_fixation(1),Dis_fixation(2)], 'Color',[0 0 0],'LineWidth', 2); hold on;
    
    set(gca,'ylim',[0 1])
    ylabel( 'distractor selection','fontsize',14,'fontweight','b', 'Interpreter', 'none' );
    set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',20);
    legend('ipsi', 'con')
   
    %Accuracy
    subplot(Plot_Colums,Plot_Rows,3);
    plot([1;2], [Accuracy(1),Accuracy(2)], 'o','color',[0 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 0 ]); hold on;
    line([1;2], [Accuracy(1),Accuracy(2)], 'Color',[0 0 0],'LineWidth', 2); hold on;
    set(gca,'ylim',[0 1])
    ylabel( 'Accuracy (%)','fontsize',14,'fontweight','b', 'Interpreter', 'none' );
    set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',20);

%% Hitrate vs Falsealarm rate
% figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
% set(gcf,'Name','Hitrate and FalseAlarmRate');

    subplot(Plot_Colums,Plot_Rows,4);
    plot([1;2], [pHit(2),pHit(4)], 'o','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 1 ]); hold on;
    line([1;2], [pHit(2),pHit(4)], 'Color',[0 0 1],'LineWidth', 2); hold on;
    plot([1;2], [pHit(1),pHit(3)], 'o','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 0 0 ]); hold on;
    line([1;2], [pHit(1),pHit(3)], 'Color',[1 0 0],'LineWidth', 2); hold on;
    set(gca,'ylim',[0 1])
    ylabel( 'Hitrate','fontsize',14,'fontweight','b', 'Interpreter', 'none' );
    set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',20);

    subplot(Plot_Colums,Plot_Rows,5);
    plot([1;2], [pFA(2),pFA(4)], 'o','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 1 ]); hold on;
    line([1;2], [pFA(2),pFA(4)], 'Color',[0 0 1],'LineWidth', 2); hold on;
    plot([1;2], [pFA(1),pFA(3)], 'o','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 0 0 ]); hold on;
    line([1;2], [pFA(1),pFA(3)], 'Color',[1 0 0],'LineWidth', 2); hold on;
  
    set(gca,'ylim',[0 1])
    ylabel( 'False alarm rate','fontsize',14,'fontweight','b', 'Interpreter', 'none' );
    set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',20);
    


%% Dprime vs Criterion
% figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
% set(gcf,'Name','Dprime vs Criterion');

    subplot(Plot_Colums,Plot_Rows,6);

    plot(dprime(1),criterion(1), 'o','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 0 ]); hold on;
    plot(dprime(2),-criterion(2), 'o','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 0 ]); hold on;% reverse direction of criterion for ipsi

    plot(dprime(3),criterion(3), 'o','color',[1 0 0] ,'MarkerSize',MarkSize,'markerfacecolor',[1 0 0]);
    plot(dprime(4),-criterion(4), 'o','color',[0 0 1] ,'MarkerSize',MarkSize,'markerfacecolor',[0 0 1]);% reverse direction of criterion for ipsi

    plot(dprime(1),criterion(1), 'o','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1 ]); hold on;
    plot(dprime(2),mult*criterion(2), 'o','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1 ]); hold on;% reverse direction of criterion for ipsi

    plot(dprime(3),criterion(3), 'o','color',[1 0 0] ,'MarkerSize',MarkSize,'markerfacecolor',[1 0 0]);
    plot(dprime(4),mult*criterion(4), 'o','color',[0 0 1] ,'MarkerSize',MarkSize,'markerfacecolor',[0 0 1]);% reverse direction of criterion for ipsi

   
    xlabel('sensitivity')
    ylabel('criterion')
    set(gca,'ylim',[-2 2])
    set(gca,'xlim',[0 4])
 
%% Graph - change in criterion or change in dprime
% figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
% set(gcf,'Name','Change in Dprime and Criterion');
    subplot(Plot_Colums,Plot_Rows,9);

plot((dprime(1)-dprime(3)),(criterion(1)-criterion(3)), 'o','color',[1 0 0] , 'MarkerSize',15,'markerfacecolor',[1 0 0 ]); hold on;
%ipsi blue 
plot((dprime(2)-dprime(4)),((mult*criterion(2))-(mult*criterion(4))), 'o','color',[0 0 1] , 'MarkerSize',15,'markerfacecolor',[0 0 1 ]); hold on;
plot((dprime(2)-dprime(4)),((-criterion(2))-(-criterion(4))), 'o','color',[0 0 1] , 'MarkerSize',15,'markerfacecolor',[0 0 1 ]); hold on;
plot((dprime(2)-dprime(4)),((mult*criterion(2))-(mult*criterion(4))), 'o','color',[0 0 1] , 'MarkerSize',15,'markerfacecolor',[0 0 1 ]); hold on;
xlabel('deltaPrePost sensitivity')
ylabel('deltaPrePost criterion')
set(gca,'ylim',[-2 2])
set(gca,'xlim',[-2 2])
legend('contra', 'ipsi')

%% OLD  graphs for criterion and dprime
%figure

subplot(Plot_Colums,Plot_Rows,7);
title([scenario sprintf('\n') 'dprime'])
plot([1 3],[dprime(1) dprime(3)],'ro-','MarkerFaceColor',[1 0 0]); hold on
plot([2 4],[dprime(2) dprime(4)],'bo-','MarkerFaceColor',[0 0 1]); hold on
set(gca,'Xlim',[0 5],'Xtick',[1:4],'XtickLabel',{'con pre' 'ipsi pre' 'con pst' 'ipsi pst'},'FontSize',12,'TickDir','out','box','off');
ylabel(['dprime'])
set(gca,'ylim',[-1 3])

subplot(Plot_Colums,Plot_Rows,8);
plot([1 3],[criterion(1) criterion(3)],'ro-','MarkerFaceColor',[1 0 0]); hold on
plot([2 4],[mult*criterion(2) mult*criterion(4)],'bo-','MarkerFaceColor',[0 0 1]); hold on % reverse direction of criterion for ipsi
plot([0 5],[0 0],'k--');
set(gca,'Xlim',[0 5],'Xtick',[1:4],'XtickLabel',{'con pre' 'ipsi pre' 'con pst' 'ipsi pst'},'FontSize',12,'TickDir','out','box','off');
ylabel(['criterion'])
set(gca,'ylim',[-2 2])






