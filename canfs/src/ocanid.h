/*
 * ocanid.h
 *
 *  Created on: Aug 2, 2016
 *      Author: bwilcutt
 *
 *  Description:
 *
 */

#ifndef OCANID_H_
#define OCANID_H_

#define type_mask 		0xc0
#define type_shr		6
#define command_mask	0x30
#define command_shr		4
#define channel_mask	0x0f
#define channel_shr		0
#define data_mask		0x00ffff00
#define data_shr		8

#define data_byte_1_mask	0x00ff0000
#define data_byte_1_shr	16
#define data_byte_2_mask	0x0000ff00
#define data_byte_2_shr	8
#define data_byte_3_mask	0x000000ff
#define data_byte_3_shr	0

#define GET_DATA_BYTE_1(x, v)	((x & data_byte_1_mask) >> data_byte_1_shr)
#define GET_DATA_BYTE_2(x, v)	((x & data_byte_2_mask) >> data_byte_2_shr)
#define GET_DATA_BYTE_3(x, v)	((x & data_byte_3_mask) >> data_byte_3_shr)

#define SET_DATA_BYTE_1(x, v)	((x & ~data_byte_1_mask) | (v << data_byte_1_shr))
#define SET_DATA_BYTE_2(x, v)	((x & ~data_byte_2_mask) | (v << data_byte_2_shr))
#define SET_DATA_BYTE_3(x, v)	((x & ~data_byte_3_mask) | (v << data_byte_3_shr))

#define GET_FRAME_TYPE(x) 		((x & type_mask) >> type_shr)
#define GET_FRAME_COMMAND(x) 	((x & command_mask) >> command_shr)
#define GET_FRAME_CHANNEL(x) 	((x & channel_mask) >> channel_shr)
#define GET_FRAME_DATA16(x) 	((uint16_t) (x[2] << 8 | x[1]))
#define GET_FRAME_DATA8(x) 		((uint8_t) (x[1]))

#define SET_FRAME_TYPE(x, v) 	((x & ~type_mask) | (v << type_shr))
#define SET_FRAME_COMMAND(x, v)	((x & ~command_mask) | (v << command_shr))
#define SET_FRAME_CHANNEL(x, v)	((x & ~channel_mask) | (v << channel_shr))
#define SET_FRAME_DATA(x, v) 	((x & ~data_mask) | (v << data_shr))

/* Defines Onyxx Commands */

#define CMD_ONYXX_IAM 	0x00 // When DevID = 0
#define CMD_ONYXX_UAR	0x01 // When DevID = 1
#define CMD_ONYXX_WAY	0x02 // When DevID = 1
#define CMD_ONYXX_RESET	0x03 // When DevID = 1
#define CMD_ONYXX_SETONE 0x01 // When DevID > 1
#define CMD_ONYXX_SETALL 0x00 // When DevID > 1



#endif /* OCANID_H_ */
