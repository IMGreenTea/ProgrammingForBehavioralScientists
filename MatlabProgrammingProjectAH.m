%Alexander Hwang
%Programming for Behavioral Scientists
%Matlab Programming Project
%12/12/2018

function MatlabProgrammingProjectAH
%Creating a full-screen figure window
    scr = get(0,'screensize');
    f = figure(1);
    set(f,'menubar','none');
    set(f,'position',[scr(1) scr(2) scr(3) scr(4)]);
    
%Presents instructions for the task.
instructions = uicontrol('units','normalize','style','text',...
    'string','Welcome to the Lexical Decision Task. In this experiment you will be presented with string of letters. If the string of letters is a word, press F. If the string of letters is not a word, press J.',...
    'FontSize',28,'position',[0.1 0.8 0.8 0.1],'fontname','Times New Roman'); %Displays directions to user
pointofExperiment = uicontrol('units','normalize','style','text',...
    'string','The purpose of this experiment is to determine whether or not the current mood of the subject affects the reaction time of the subject in the Lexical Decision Task. The user will be presented various strings of words that have positive, negative, or neutral connotations. The time it takes for the user to determine whether or not the string of letters is a word or not will be recorded. ',...
    'FontSize',24,'position',[0.1 0.1 0.3 0.6],'horizontalAlignment', 'left','fontname','Times New Roman'); %Explains point of the experiment to the user
moodText = uicontrol('units','normalize','style','text',...
    'string','Before continuning, how are you feeling today? (Please select from the dropdown menu below, then press continue.)','FontSize',24,'position',[0.5 0.4 0.2 0.3],...
    'horizontalAlignment', 'left','fontname','Times New Roman'); %Asks the user to input his or her mood
moodChoice = uicontrol('units','normalize','style','popupmenu',...
'string',{'Happy','Sad','Neutral'},'position',[0.5 0.4 0.2 0.1],...
'fontname','Times New Roman','FontSize',24,...
'Callback',@selection); %Saves the user's selection to be used later in the program
continueButton = uicontrol('units','normalize','style','pushbutton','string','Continue',...
    'position',[0.8 0.1 0.1 0.1],'fontname','Times New Roman','FontSize',24,'CallBack',@buttonpressed); %Experiment begins once the user presses continue
global moodSelection %setting moodSelection to global variable so that all functions can use the variable

    function selection(varargin)
        %Saves the user choice for what mood they are feeling
        stringVal = get(moodChoice,'Value'); 
        moodSelection = stringVal; %Sets the mood choice to global variable
    end
    function buttonpressed(hObject,eventdata,handles)
        %Closes previous window on button press, creates new figure window
        close(f); 
        g = figure(2);
        set(g,'menubar','none');
        set(g,'position',[scr(1) scr(2) scr(3) scr(4)]);
        %Instructions for experiment appear
        secondInstructions = uicontrol('units','normalize','style','text',...
        'string','If the string of letters is a word, press F. If the string of letters is not a word, press J.',...
        'FontSize',30,'position',[0.1 0.9 0.8 0.1],'fontname','Times New Roman');
        %List of both happy and sad words some misspelled others spelled
        %correctly.
        happyWords = {'laughter', 'Hapinss', 'lve', 'excEllentt', 'joy', 'suessFul', 'win', 'rainbow', 'smile','ranbows'};
        sadWords = {'sOrro','sickd','painul','sad','desoyed','rejected','cryy','bankruptcy','iNjred','evil'};
        %Preallocating the reaction time variables. 
        happyreactionTime=[];
        sadreactionTime=[];
        if(moodSelection==1) %if the user selected the happy mood, it will display the happy words first then the sad words.
            for numOfTrials = 1:10 %Runs through 10 times for 10 different words
                tic
                textbox = uicontrol('units','normalize','style','text',...
                'string',happyWords{numOfTrials},'FontSize',60,...
                'position',[0.25 0.25 0.5 0.5]);
                k = waitforbuttonpress;
                %Reaction is only recorded if the user presses F or J
                if (strcmp(get(gcf,'currentcharacter'),'f')||strcmp(get(gcf,'currentcharacter'),'j')) %make sure that the user is inputting only F or J
                time = toc;
                happyreactionTime(numOfTrials) = time; %Stores the reaction times in array
                else
                end
            end
            for numOfTrials = 1:10 %Second run through but with sad words
                tic
                textbox = uicontrol('units','normalize','style','text',...
                'string',sadWords{numOfTrials},'FontSize',60,...
                'position',[0.25 0.25 0.5 0.5]);
                k = waitforbuttonpress;
                if (strcmp(get(gcf,'currentcharacter'),'f')||strcmp(get(gcf,'currentcharacter'),'j')) %make sure that the user is inputting only F or J
                time = toc;
                sadreactionTime(numOfTrials) = time; %Stores the reaction times in array
                else
                end
            end
        elseif (moodSelection==3) %If user selected neutral mood will follow same method as happy mood.
            for numOfTrials = 1:10
                tic
                textbox = uicontrol('units','normalize','style','text',...
                'string',happyWords{numOfTrials},'FontSize',60,...
                'position',[0.25 0.25 0.5 0.5]);
                k = waitforbuttonpress;
                if (strcmp(get(gcf,'currentcharacter'),'f')||strcmp(get(gcf,'currentcharacter'),'j')) %make sure that the user is inputting only F or J
                time = toc;
                happyreactionTime(numOfTrials) = time; %Stores the reaction times in array
                else
                end
            end
            for numOfTrials = 1:10
                tic
                textbox = uicontrol('units','normalize','style','text',...
                'string',sadWords{numOfTrials},'FontSize',60,...
                'position',[0.25 0.25 0.5 0.5]);
                k = waitforbuttonpress;
                if (strcmp(get(gcf,'currentcharacter'),'f')||strcmp(get(gcf,'currentcharacter'),'j')) %make sure that the user is inputting only F or J
                time = toc;
                sadreactionTime(numOfTrials) = time; %Stores the reaction times in array
                else
                end
            end
        else %If user selected sad mood, it will display sad words first then the happy words.
            for numOfTrials = 1:10
                tic
                textbox = uicontrol('units','normalize','style','text',...
                'string',sadWords{numOfTrials},'FontSize',60,...
                'position',[0.25 0.25 0.5 0.5]);
                k = waitforbuttonpress;
                if (strcmp(get(gcf,'currentcharacter'),'f')||strcmp(get(gcf,'currentcharacter'),'j')) %make sure that the user is inputting only F or J
                time = toc;
                sadreactionTime(numOfTrials) = time; %Stores the reaction times in array
                else
                end
            end
            for numOfTrials = 1:10
                tic
                textbox = uicontrol('units','normalize','style','text',...
                'string',happyWords{numOfTrials},'FontSize',60,...
                'position',[0.25 0.25 0.5 0.5]);
                k = waitforbuttonpress;
                if (strcmp(get(gcf,'currentcharacter'),'f')||strcmp(get(gcf,'currentcharacter'),'j')) %make sure that the user is inputting only F or J
                time = toc;
                happyreactionTime(numOfTrials) = time; %Stores the reaction times in array
                else
                end
            end
        end
        %Finishing up experiment
        experimentNumber = num2str(randi([10000 50000],1)); %Using randomnumber generator to create subject ID
        fileName = ['Resultsfor',experimentNumber,datestr(now, 'mmmm-dd-yyyy'),'.txt']; %filename will be the subjectID + current date
        
        happyTimeAvg = mean(happyreactionTime); %Calculates mean happy word reaction time.
        sadTimeAvg = mean(sadreactionTime); %Calculates mean sad word reaction time. 
        
        fid=fopen(fileName,'w+'); %Outputs results of experiment to text file with corresponding text name
        
        %Writing to text file results of the data:
        if (happyTimeAvg > sadTimeAvg)
            timeDifference = happyTimeAvg - sadTimeAvg;
            fprintf(fid,'The results of the experiment are the following: \n It took you on average %2.3f seconds to identify happy words and %2.3f seconds to identify sad words. You responded to sad words %2.3f seconds faster than happy words.',happyTimeAvg,sadTimeAvg,timeDifference);
        else
            timeDifference = sadTimeAvg - happyTimeAvg;
            fprintf(fid,'The results of the experiment are the following: \n It took you on average %2.3f seconds to identify happy words and %2.3f seconds to identify sad words. You responded to happy words %2.3f seconds faster than sad words.',happyTimeAvg,sadTimeAvg,timeDifference);
        end
        
        close all;
        thankyouImage = imread('thankyou.png');
        imshow(thankyouImage); %Displays thank you image to subject, signifying end of the experiment
        pause(5); %Waits 5 seconds then closes the image
        close all;
    end
end
