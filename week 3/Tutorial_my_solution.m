%% Question 1: RGB-D Cameras 

clear all
clc
bag = rosbag('/home/esteban/Documents/Sensors_and_Control/tutorial_RGBD.bag')

% to check the message type that is next too the topic go open the bag and
% check the corresponding topic and message from the recording bag
depthImage =select(bag,'Topic','/camera/depth/image_raw')

firstDepthImage = readMessages(depthImage,1)

RGBImage = select(bag,'Topic','/camera/rgb/image_raw')
firstRGBImage = readMessages(RGBImage,1);

rgb_image = readImage(firstRGBImage{1});
d_image = readImage(firstDepthImage{1}); % the ine is to take the single coloumn on that matrix and put in to an image matrix format

figure
imshow(rgb_image);

figure
imshow(uint8(double(d_image)/6000*255)) % this was done for scaling purposes. The matrix has depth values that dont translate to image values and need to be casted and adjusted


    %readMessages Read messages from rosbag
            %   MSGS = readMessages(BAGSEL) returns data from all of the
            %   messages in the BagSelection object, BAGSEL. The messages will
            %   be returned in a cell array of message objects, MSGS.
            %
            %   MSGS = readMessages(BAGSEL, ROWS) returns data from messages
            %   in the rows specified by the ROWS argument. The maximum
            %   range of the ROWS argument is [1,BAGSEL.NumMessages].
            %
            %   MSGSTRUCTS = readMessages(___, 'DataFormat', 'struct') returns message
            %   data as a cell array of structs. Using structs can be significantly
            %   faster than using message objects and you can retrieve custom message
            %   data directly.
            %
            %   When working with large numbers of messages, this method
            %   consumes a lot of time and system memory. Consider using
            %   the select method to create a smaller BagSelection object
            %   before calling readMessages.
            %
            %
            
            
            %readImage Convert the ROS image data into a MATLAB image
            %   [IMG,ALPHA] = readImage(OBJ) converts the raw image data in
            %   the message object OBJ into an image matrix IMG that is
            %   appropriate for further image processing in MATLAB. If the
            %   raw image contains an alpha channel, it will be returned in
            %   ALPHA. If no alpha channel exists, ALPHA will be empty.
            %
            %   ROS image message data is stored in a format that is not
            %   compatible with further image processing in MATLAB. Based
            %   on the specified encoding, this function will convert the
            %   data into an appropriate MATLAB image and return it.
            %
            %   The following encodings for raw images of size MxN are supported:
            %   * rgb8, rgba8, bgr8, and bgra8: IMG is an RGB image
            %   of size MxNx3. The alpha channel is returned in ALPHA.
            %   Each value in the outputs is represented as a uint8.
            %
            %   * rgb16, rgba16, bgr16, and bgra16: IMG is an RGB image
            %   of size MxNx3. The alpha channel is returned in ALPHA.
            %   Each value in the outputs is represented as a uint16.
            %
            %   * mono8 images are returned as gray-scale images of size
            %   MxNx1. Each pixel value is represented as a uint8.
            %
            %   * mono16 images are returned as gray-scale images of size
            %   MxNx1. Each pixel value is represented as a uint16.
            %
            %   * 32fcX images are returned as floating-point images of size
            %   MxNxX, where X is either 1,2,3, or 4. Each pixel value is
            %   represented as a single.
            %
            %   * 64fcX images are returned as floating-point images of size
            %   MxNxX, where X is either 1,2,3, or 4. Each pixel value is
            %   represented as a double.
            %
            %   * 8ucX images are returned as matrices of size
            %   MxNxX, where X is either 1,2,3, or 4. Each pixel value is
            %   represented as a uint8.
            %
            %   * 8scX images are returned as matrices of size
            %   MxNxX, where X is either 1,2,3, or 4. Each pixel value is
            %   represented as a int8.
            %
            %   * 16ucX images are returned as matrices of size
            %   MxNxX, where X is either 1,2,3, or 4. Each pixel value is
            %   represented as a uint16.
            %
            %   * 16scX images are returned as matrices of size
            %   MxNxX, where X is either 1,2,3, or 4. Each pixel value is
            %   represented as a int16.
            %
            %   * 32scX images are returned as matrices of size
            %   MxNxX, where X is either 1,2,3, or 4. Each pixel value is
            %   represented as a int32.
            %
            %   * bayer_X encoded images are either returned as raw Bayer
            %   matrices of size MxNx1, or as de-bayered RGB images of size
            %   MxNx3 (if a license of the Image Processing Toolbox is
            %   present).
            %
            %   Other encodings are currently unsupported.
            %            
            %   See also: writeImage            
            
            %   This function reads the raw byte-stream from rosjava
            %   and converts it into a representation that can be used by
            %   MATLAB's image or imshow functions.
            %   ROS stores channel data per image pixel, i.e.
            %   rgbrgbrgb..., whereas MATLAB stores complete channels for
            %   all image pixels, i.e. rrrr...gggg....bbbb...
            %   This function implements the appropriate conversion.
            
             %writeImage Write a MATLAB image to the ROS image message
            %   writeImage(OBJ, IMG) converts the MATLAB image IMG and
            %   stores the ROS compatible image data in the message object
            %   OBJ.
            %
            %   writeImage(OBJ, IMG, ALPHA) converts the MATLAB image IMG.
            %   If the image encoding supports an alpha channel (rgba
            %   or bgra family), this alpha channel can be specified as optional
            %   input ALPHA. Alternatively, the input image IMG can also
            %   store the alpha channel as its fourth channel.
            %
            %   The encoding of the input image has to be specified in the
            %   'encoding' property of the image message. If no encoding
            %   is specified before this function is called, the default
            %   encoding 'rgb8' will be used (3-channel RGB image with
            %   uint8 values).
            %
            %   All encodings supported for reading are also supported by
            %   the writeImage function. For more information on supported
            %   encodings and their representation in MATLAB, see the readImage
            %   function.
            %
            %   Bayer-encoded images (encodings 'bayer_rggb8',
            %   'bayer_bggr8', 'bayer_gbrg8', 'bayer_grbg8' and their
            %   16-bit equivalents) will not be Bayer-encoded but have to
            %   be given as 8-bit or 16-bit single-channel images
            %            
            %   See also: readImage.
            