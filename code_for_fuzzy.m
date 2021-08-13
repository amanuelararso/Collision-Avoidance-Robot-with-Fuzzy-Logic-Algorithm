vrep=remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

noDetectionDist=0.9; 
maxDetectionDist=0.2;
if(clientID >=-1)
    disp('connection successful');
    %declaration of objects -- handles
        %motors
    [returnCode,left_motor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_leftMotor',vrep.simx_opmode_blocking); %for left motor
    [returnCode,right_motor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_rightMotor',vrep.simx_opmode_blocking); %for right motor
        %ultrasonic sensors
    [returnCode,US_sensor_1]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor1',vrep.simx_opmode_blocking); 
%     [returnCode,US_sensor_2]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor2',vrep.simx_opmode_blocking); 
%     [returnCode,US_sensor_3]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor3',vrep.simx_opmode_blocking); 
%     [returnCode,US_sensor_4]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor4',vrep.simx_opmode_blocking);
    [returnCode,US_sensor_5]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor5',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_6]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor6',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_7]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor7',vrep.simx_opmode_blocking);
    [returnCode,US_sensor_8]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor8',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_9]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor9',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_10]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor10',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_11]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor11',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_12]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor12',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_13]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor13',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_14]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor14',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_15]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor15',vrep.simx_opmode_blocking);
%     [returnCode,US_sensor_16]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor16',vrep.simx_opmode_blocking);
    
    
    
    
    %declaration of start of the sensors  - - the first call
    [returnCode,detectionState,detectedPoint1,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_1,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint2,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_2,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint3,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_3,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint4,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_4,vrep.simx_opmode_streaming);
    [returnCode,detectionState,detectedPoint5,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_5,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint6,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_6,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint7,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_7,vrep.simx_opmode_streaming);
    [returnCode,detectionState,detectedPoint8,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_8,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint9,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_9,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint10,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_10,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint11,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_11,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint12,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_12,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint13,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_13,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint14,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_14,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint15,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_15,vrep.simx_opmode_streaming);
%     [returnCode,detectionState,detectedPoint16,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_16,vrep.simx_opmode_streaming);
    
       
       
    
    fis_file = readfis('algorithm.fis');
    while(1) 
    [returnCode,detectionState,detectedPoint1,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_1,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint2,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_2,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint3,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_3,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint4,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_4,vrep.simx_opmode_buffer);
    [returnCode,detectionState,detectedPoint5,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_5,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint6,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_6,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint7,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_7,vrep.simx_opmode_buffer);
    [returnCode,detectionState,detectedPoint8,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_8,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint9,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_9,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint10,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_10,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint11,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_11,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint12,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_12,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint13,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_13,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint14,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_14,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint15,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_15,vrep.simx_opmode_buffer);
%     [returnCode,detectionState,detectedPoint16,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_16,vrep.simx_opmode_buffer);
        
         us1 = double(detectedPoint1(3)); % third element in the array is used since it is the front direction for the ultrasonic
        us5 = double(detectedPoint5(3));
        us8 = double(detectedPoint8(3));

        
        if(us1<maxDetectionDist) 
            us1=maxDetectionDist;
            
        elseif(us1>noDetectionDist) 
            us1=noDetectionDist;
        end
        
        if(us5<maxDetectionDist)  
            us5=maxDetectionDist;
        elseif(us5>noDetectionDist)
            us5=noDetectionDist;
        end
        
        if(us8<maxDetectionDist)
            u81=maxDetectionDist;
        elseif(us8>noDetectionDist)
            us8=noDetectionDist;
        end
            
        disp([us1 us5 us8])
        
        velocity=evalfis([us1 us5 us8], fis_file);
        
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,right_motor,velocity(1),vrep.simx_opmode_blocking);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,left_motor,velocity(2),vrep.simx_opmode_blocking);
           
        pause(3)
        
    end
    
end

disp('Connection UNSUCCESSFUL')

vrep.simxFinish(-1);
vrep.delete();  % call the distructor!!!!