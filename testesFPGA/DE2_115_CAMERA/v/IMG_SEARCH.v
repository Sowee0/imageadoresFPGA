module IMG_SEARCH(
		iCLK,
		iX, 	//Image search input coordinate, X
		iY, 	//Image search input coordinate, Y	
		oVAL	//Pixel value on XY coordinates output
	);
	
	input							iCLK;
	input				[12:0]	iX;
	input 			[12:0] 	iY;
	output	reg	[9:0] 	oVAL;
	
	parameter [3:0] halving = 4'd4; 
	
	reg 			decX;
	reg 			decY;
	reg 	[7:0] memPos;
	
	always @ (posedge iCLK) begin
	
	decX <= iX >> halving;
	decY <= iY >> halving;
	
	memPos <=  decX + 12'd16 * decY;
	
	case (memPos)
		8'd0:		oVAL <= 10'd255;
		8'd1:		oVAL <= 10'd255;
		8'd2:		oVAL <= 10'd255;
		8'd3:		oVAL <= 10'd255;
		8'd4:		oVAL <= 10'd255;
		8'd5:		oVAL <= 10'd255;
		8'd6:		oVAL <= 10'd255;
		8'd7:		oVAL <= 10'd255;
		8'd8:		oVAL <= 10'd255;
		8'd9:		oVAL <= 10'd255;
		8'd10:	oVAL <= 10'd255;
		8'd11:	oVAL <= 10'd255;
		8'd12:	oVAL <= 10'd255;
		8'd13:	oVAL <= 10'd255;
		8'd14:	oVAL <= 10'd255;
		8'd15:	oVAL <= 10'd255;
		8'd16:	oVAL <= 10'd255;
		8'd17:	oVAL <= 10'd255;
		8'd18:	oVAL <= 10'd255;
		8'd19:	oVAL <= 10'd255;
		8'd20:	oVAL <= 10'd255;
		8'd21:	oVAL <= 10'd255;
		8'd22:	oVAL <= 10'd255;
		8'd23:	oVAL <= 10'd255;
		8'd24:	oVAL <= 10'd255;
		8'd25:	oVAL <= 10'd255;
		8'd26:	oVAL <= 10'd255;
		8'd27:	oVAL <= 10'd255;
		8'd28:	oVAL <= 10'd255;
		8'd29:	oVAL <= 10'd255;
		8'd30:	oVAL <= 10'd255;
		8'd31:	oVAL <= 10'd255;
		8'd32:	oVAL <= 10'd255;
		8'd33:	oVAL <= 10'd255;
		8'd34:	oVAL <= 10'd255;
		8'd35:	oVAL <= 10'd255;
		8'd36:	oVAL <= 10'd255;
		8'd37:	oVAL <= 10'd255;
		8'd38:	oVAL <= 10'd255;
		8'd39:	oVAL <= 10'd255;
		8'd40:	oVAL <= 10'd255;
		8'd41:	oVAL <= 10'd255;
		8'd42:	oVAL <= 10'd255;
		8'd43:	oVAL <= 10'd255;
		8'd44:	oVAL <= 10'd255;
		8'd45:	oVAL <= 10'd255;
		8'd46:	oVAL <= 10'd255;
		8'd47:	oVAL <= 10'd255;
		8'd48:	oVAL <= 10'd255;
		8'd49:	oVAL <= 10'd255;
		8'd50:	oVAL <= 10'd255;
		8'd51:	oVAL <= 10'd255;
		8'd52:	oVAL <= 10'd255;
		8'd53:	oVAL <= 10'd255;
		8'd54:	oVAL <= 10'd255;
		8'd55:	oVAL <= 10'd255;
		8'd56:	oVAL <= 10'd255;
		8'd57:	oVAL <= 10'd255;
		8'd58:	oVAL <= 10'd255;
		8'd59:	oVAL <= 10'd255;
		8'd60:	oVAL <= 10'd255;
		8'd61:	oVAL <= 10'd255;
		8'd62:	oVAL <= 10'd255;
		8'd63:	oVAL <= 10'd255;
		8'd64:	oVAL <= 10'd255;
		8'd65:	oVAL <= 10'd255;
		8'd66:	oVAL <= 10'd255;
		8'd67:	oVAL <= 10'd255;
		8'd68:	oVAL <= 10'd255;
		8'd69:	oVAL <= 10'd255;
		8'd70:	oVAL <= 10'd255;
		8'd71:	oVAL <= 10'd255;
		8'd72:	oVAL <= 10'd255;
		8'd73:	oVAL <= 10'd255;
		8'd74:	oVAL <= 10'd255;
		8'd75:	oVAL <= 10'd0;
		8'd76:	oVAL <= 10'd0;
		8'd77:	oVAL <= 10'd255;
		8'd78:	oVAL <= 10'd255;
		8'd79:	oVAL <= 10'd255;
		8'd80:	oVAL <= 10'd255;
		8'd81:	oVAL <= 10'd255;
		8'd82:	oVAL <= 10'd255;
		8'd83:	oVAL <= 10'd255;
		8'd84:	oVAL <= 10'd0;
		8'd85:	oVAL <= 10'd255;
		8'd86:	oVAL <= 10'd255;
		8'd87:	oVAL <= 10'd255;
		8'd88:	oVAL <= 10'd255;
		8'd89:	oVAL <= 10'd255;
		8'd90:	oVAL <= 10'd255;
		8'd91:	oVAL <= 10'd255;
		8'd92:	oVAL <= 10'd255;
		8'd93:	oVAL <= 10'd255;
		8'd94:	oVAL <= 10'd255;
		8'd95:	oVAL <= 10'd255;
		8'd96:	oVAL <= 10'd255;
		8'd97:	oVAL <= 10'd255;
		8'd98:	oVAL <= 10'd255;
		8'd99:	oVAL <= 10'd255;
		8'd100:	oVAL <= 10'd255;
		8'd101:	oVAL <= 10'd255;
		8'd102:	oVAL <= 10'd255;
		8'd103:	oVAL <= 10'd255;
		8'd104:	oVAL <= 10'd255;
		8'd105:	oVAL <= 10'd255;
		8'd106:	oVAL <= 10'd255;
		8'd107:	oVAL <= 10'd255;
		8'd108:	oVAL <= 10'd255;
		8'd109:	oVAL <= 10'd255;
		8'd110:	oVAL <= 10'd255;
		8'd111:	oVAL <= 10'd255;
		8'd112:	oVAL <= 10'd255;
		8'd113:	oVAL <= 10'd255;
		8'd114:	oVAL <= 10'd255;
		8'd115:	oVAL <= 10'd255;
		8'd116:	oVAL <= 10'd255;
		8'd117:	oVAL <= 10'd255;
		8'd118:	oVAL <= 10'd255;
		8'd119:	oVAL <= 10'd255;
		8'd120:	oVAL <= 10'd255;
		8'd121:	oVAL <= 10'd255;
		8'd122:	oVAL <= 10'd255;
		8'd123:	oVAL <= 10'd255;
		8'd124:	oVAL <= 10'd255;
		8'd125:	oVAL <= 10'd255;
		8'd126:	oVAL <= 10'd255;
		8'd127:	oVAL <= 10'd255;
		8'd128:	oVAL <= 10'd255;
		8'd129:	oVAL <= 10'd255;
		8'd130:	oVAL <= 10'd255;
		8'd131:	oVAL <= 10'd255;
		8'd132:	oVAL <= 10'd255;
		8'd133:	oVAL <= 10'd255;
		8'd134:	oVAL <= 10'd255;
		8'd135:	oVAL <= 10'd255;
		8'd136:	oVAL <= 10'd255;
		8'd137:	oVAL <= 10'd255;
		8'd138:	oVAL <= 10'd255;
		8'd139:	oVAL <= 10'd255;
		8'd140:	oVAL <= 10'd255;
		8'd141:	oVAL <= 10'd255;
		8'd142:	oVAL <= 10'd255;
		8'd143:	oVAL <= 10'd255;
		8'd144:	oVAL <= 10'd255;
		8'd145:	oVAL <= 10'd255;
		8'd146:	oVAL <= 10'd255;
		8'd147:	oVAL <= 10'd255;
		8'd148:	oVAL <= 10'd255;
		8'd149:	oVAL <= 10'd255;
		8'd150:	oVAL <= 10'd255;
		8'd151:	oVAL <= 10'd255;
		8'd152:	oVAL <= 10'd255;
		8'd153:	oVAL <= 10'd255;
		8'd154:	oVAL <= 10'd255;
		8'd155:	oVAL <= 10'd255;
		8'd156:	oVAL <= 10'd255;
		8'd157:	oVAL <= 10'd255;
		8'd158:	oVAL <= 10'd255;
		8'd159:	oVAL <= 10'd255;
		8'd160:	oVAL <= 10'd255;
		8'd161:	oVAL <= 10'd255;
		8'd162:	oVAL <= 10'd255;
		8'd163:	oVAL <= 10'd255;
		8'd164:	oVAL <= 10'd255;
		8'd165:	oVAL <= 10'd255;
		8'd166:	oVAL <= 10'd255;
		8'd167:	oVAL <= 10'd255;
		8'd168:	oVAL <= 10'd255;
		8'd169:	oVAL <= 10'd255;
		8'd170:	oVAL <= 10'd255;
		8'd171:	oVAL <= 10'd255;
		8'd172:	oVAL <= 10'd255;
		8'd173:	oVAL <= 10'd255;
		8'd174:	oVAL <= 10'd255;
		8'd175:	oVAL <= 10'd0;
		8'd176:	oVAL <= 10'd255;
		8'd177:	oVAL <= 10'd255;
		8'd178:	oVAL <= 10'd255;
		8'd179:	oVAL <= 10'd0;
		8'd180:	oVAL <= 10'd255;
		8'd181:	oVAL <= 10'd255;
		8'd182:	oVAL <= 10'd255;
		8'd183:	oVAL <= 10'd255;
		8'd184:	oVAL <= 10'd255;
		8'd185:	oVAL <= 10'd255;
		8'd186:	oVAL <= 10'd255;
		8'd187:	oVAL <= 10'd255;
		8'd188:	oVAL <= 10'd255;
		8'd189:	oVAL <= 10'd255;
		8'd190:	oVAL <= 10'd255;
		8'd191:	oVAL <= 10'd0;
		8'd192:	oVAL <= 10'd255;
		8'd193:	oVAL <= 10'd255;
		8'd194:	oVAL <= 10'd255;
		8'd195:	oVAL <= 10'd0;
		8'd196:	oVAL <= 10'd0;
		8'd197:	oVAL <= 10'd255;
		8'd198:	oVAL <= 10'd255;
		8'd199:	oVAL <= 10'd255;
		8'd200:	oVAL <= 10'd255;
		8'd201:	oVAL <= 10'd255;
		8'd202:	oVAL <= 10'd255;
		8'd203:	oVAL <= 10'd255;
		8'd204:	oVAL <= 10'd255;
		8'd205:	oVAL <= 10'd255;
		8'd206:	oVAL <= 10'd255;
		8'd207:	oVAL <= 10'd0;
		8'd208:	oVAL <= 10'd255;
		8'd209:	oVAL <= 10'd255;
		8'd210:	oVAL <= 10'd255;
		8'd211:	oVAL <= 10'd255;
		8'd212:	oVAL <= 10'd0;
		8'd213:	oVAL <= 10'd0;
		8'd214:	oVAL <= 10'd255;
		8'd215:	oVAL <= 10'd255;
		8'd216:	oVAL <= 10'd255;
		8'd217:	oVAL <= 10'd255;
		8'd218:	oVAL <= 10'd255;
		8'd219:	oVAL <= 10'd255;
		8'd220:	oVAL <= 10'd255;
		8'd221:	oVAL <= 10'd255;
		8'd222:	oVAL <= 10'd0;
		8'd223:	oVAL <= 10'd0;
		8'd224:	oVAL <= 10'd255;
		8'd225:	oVAL <= 10'd255;
		8'd226:	oVAL <= 10'd255;
		8'd227:	oVAL <= 10'd255;
		8'd228:	oVAL <= 10'd255;
		8'd229:	oVAL <= 10'd0;
		8'd230:	oVAL <= 10'd0;
		8'd231:	oVAL <= 10'd255;
		8'd232:	oVAL <= 10'd255;
		8'd233:	oVAL <= 10'd255;
		8'd234:	oVAL <= 10'd255;
		8'd235:	oVAL <= 10'd255;
		8'd236:	oVAL <= 10'd255;
		8'd237:	oVAL <= 10'd255;
		8'd238:	oVAL <= 10'd0;
		8'd239:	oVAL <= 10'd255;
		8'd240:	oVAL <= 10'd255;
		8'd241:	oVAL <= 10'd255;
		8'd242:	oVAL <= 10'd255;
		8'd243:	oVAL <= 10'd255;
		8'd244:	oVAL <= 10'd255;
		8'd245:	oVAL <= 10'd255;
		8'd246:	oVAL <= 10'd0;
		8'd247:	oVAL <= 10'd0;
		8'd248:	oVAL <= 10'd0;
		8'd249:	oVAL <= 10'd0;
		8'd250:	oVAL <= 10'd0;
		8'd251:	oVAL <= 10'd0;
		8'd252:	oVAL <= 10'd0;
		8'd253:	oVAL <= 10'd0;
		8'd254:	oVAL <= 10'd0;
		8'd255:	oVAL <= 10'd255;
		
		default: oVAL <= 10'd0;
		
		endcase

	end
	
	endmodule 