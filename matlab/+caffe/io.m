classdef io
  % a class for input and output functions
  
  methods (Static)
    function im_data = load_image(im_file)
      % im_data = load_image(im_file)
      %   load an image from disk into Caffe-supported data format
      %   switch channels from RGB to BGR, make width the fastest dimension
      %   and convert to single
      CHECK(ischar(im_file), 'im_file must be a string');
      CHECK_FILE_EXIST(im_file);
      im_data = imread(im_file);
      im_data = im_data(:, :, [3, 2, 1]);
      im_data = permute(im_data, [2, 1, 3]);
      im_data = single(im_data);
    end
    function mean_data = read_mean(mean_proto_file)
      % mean_data = read_mean(mean_proto_file)
      %   read image mean data from binaryproto file
      CHECK(ischar(mean_proto_file), 'mean_proto_file must be a string');
      CHECK_FILE_EXIST(mean_proto_file);
      mean_data = caffe_('read_mean', mean_proto_file);
    end
  end
end
