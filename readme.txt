The processing steps in the Golay demo shown in the YouTube video: https://youtu.be/Ef-iD_8tT2U

1: read_encode_write_image.m
Read the image file and and add the Golay parity bits as pixels and write the result in the target file.

2: read_adderrors_write_image.m
Read the image file, add bit errors with the specified probability and write the result in the target file.

3: read_decode_write_image.m
Read the image file containing both the original image pixels and the parity pixels. Decode the Golay codewords and write the decoded image to the target file.

4: read_compare_2_images.m
Read two image files and count the number of differing pixels.
