%Preferences - Must be set identically to the GenerateData file
Ts = 0.002; %SampleTime
fileName = 'chirpFunc';

%Convert Data into a usable format
dataSet = load(fileName);
Y = dataSet.(fileName).output.signal;
U = dataSet.(fileName).input.signal;
time = dataSet.(fileName).input.time;


%Often, the output produced is 2-5 elements larger than the input. Don't
%know why. This cleans it by trimming the output
IDim = size(U);
ODim = size(Y);
Overage = ODim(1)-IDim(1);

CleanedY = Y;

for i = 1:Overage
    CleanedY(IDim(1)+1) = [];
end

IOData = iddata(CleanedY,U,Ts);

 SSmodelNoise = n4sid(IOData,1:10); %Includes estimate of K noise matrix
 tfNoise = ss2tf(SSmodelNoise.a,SSmodelNoise.b,SSmodelNoise.c,SSmodelNoise.d)
 SSmodelClean = n4sid(IOData,1:10,'DisturbanceModel','none'); %Omits K noise matrix
 tfClean = ss2tf(SSmodelClean.a,SSmodelClean.b,SSmodelClean.c,SSmodelClean.d)



